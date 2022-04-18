import 'package:fasal/constants/all_crops.dart';
import 'package:fasal/constants/keys.dart';
import 'package:fasal/constants/lists.dart';
import 'package:fasal/services/mlapi_services.dart';
import 'package:fasal/services/weatherapi_services.dart';
import 'package:fasal/widgets/crop_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../models/crop.dart';
import '../../widgets/drawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../widgets/in_app_webview.dart';

class FormPage extends StatefulWidget {

   FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  MlApiServices _mlApiServices = MlApiServices();
  WeatherApiServices _weatherApiServices = WeatherApiServices();

  int currentStep = 0;
  bool isCompleted = false;
  List<Crop> recommendedCropsList = [];
  final formkey = GlobalKey<FormState>();

  String currentState = "ANDHRA PRADESH";
  late String currentDistrict;
  late List<String>? districtsList;

  //TextEditingController stateTextEditingController = TextEditingController();
  //TextEditingController districtTextEditingController = TextEditingController();
  TextEditingController temperatureTextEditingController = TextEditingController();
  TextEditingController humidityTextEditingController = TextEditingController();
  TextEditingController rainfallTextEditingController = TextEditingController();
  TextEditingController nTextEditingController = TextEditingController();
  TextEditingController pTextEditingController = TextEditingController();
  TextEditingController kTextEditingController = TextEditingController();
  TextEditingController phTextEditingController = TextEditingController();
  TextEditingController budgetTextEditingController = TextEditingController();
  TextEditingController areaTextEditingController = TextEditingController();
  TextEditingController otherTextEditingController = TextEditingController();

  Map getRainfallDataMap(){
    return {
      "state": currentState,
      "district": currentDistrict,
      "month": DateTime.now().month.toString(),
    };
  }

  Map getFarmerDataMap(){
    return {
      "N": nTextEditingController.text,
      "P": pTextEditingController.text,
      "K": kTextEditingController.text,
      "temperature": temperatureTextEditingController.text,
      "humidity": humidityTextEditingController.text,
      "pH": phTextEditingController.text,
      "rainfall": rainfallTextEditingController.text
    };
  }

  getClimateValues() async {
    String rainfall = await _mlApiServices.predictRainfall(getRainfallDataMap());
    dynamic latLon = await _weatherApiServices.geocoding(state: currentState, district: currentDistrict);
    print("lat+lon: $latLon");
    if(rainfall!="Something went wrong, please try again."){
      if(latLon != "Something went wrong, please try again."){
        dynamic tempHum = await _weatherApiServices.getTempAndHumidity(lat: latLon['lat'].toString(), lon: latLon['lon'].toString());
        print("tempHum: $tempHum");
        if(tempHum != "Something went wrong, please try again."){
          setState(() {
            rainfallTextEditingController.text = rainfall;
            temperatureTextEditingController.text = ((tempHum['temp']-273.15).round()).toString();
            humidityTextEditingController.text = tempHum['humidity'].toString();
          });
        } else {
          setState(() {
            rainfallTextEditingController.text = rainfall;
            temperatureTextEditingController.text = '25.8';
            humidityTextEditingController.text = '6.7';
          });
        }
      } else {
        setState(() {
          rainfallTextEditingController.text = rainfall;
          temperatureTextEditingController.text = '25.8';
          humidityTextEditingController.text = '6.7';
        });
      }
    } else {
      setState(() {
        rainfallTextEditingController.text = '79.7';
        temperatureTextEditingController.text = '25.8';
        humidityTextEditingController.text = '6.7';
      });
    }
  }

  getCropsList() async {
    List<Crop> recommendedCrops = [];

    String recommendations = await _mlApiServices.recommendCrops(getFarmerDataMap());
    print("RECOMMENDATIONS: $recommendations");
    if(recommendations!="Something went wrong, please try again."){
      List<String> recommendationsList = recommendations.split('-');
      recommendationsList.removeLast();
      recommendationsList.forEach((crop) {
        recommendedCrops.add(Crop(name: allCrops[crop]['title'], photo: allCrops[crop]['photo']));
      });
    }
    setState(() {
      recommendedCropsList = recommendedCrops;
    });
  }

  @override
  void initState() {
    currentDistrict = allStatesAndDistrictsMap[currentState]![0];
    districtsList = allStatesAndDistrictsMap[currentState];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mayGreen,

        title: Text('What can I grow?'),

      ),
      body: isCompleted
        ? buildCompleted()
      : Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: oliveGreen,),
        ),
        child: Stepper(
          //type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () async {
            final isLastStep = currentStep == getSteps().length - 1;
            if(isLastStep){
              if(formkey.currentState!.validate()){
                setState(() => isCompleted = true);
                print('Completed');
                await getCropsList();
              }
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepTapped: (step) => setState(() => currentStep = step),
          onStepCancel:
              currentStep == 0 ? null : ()=> setState(() => currentStep -= 1),
          controlsBuilder: (BuildContext context, ControlsDetails details){
            final isLastStep = currentStep == getSteps().length -1;
            final isSecondStep = currentStep == getSteps().length -3;
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(
                        child: Text(isLastStep ? 'CONFIRM' : 'Next'),
                        onPressed:
                          details.onStepContinue,
                      ),

                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      if(currentStep != 0)
                      Expanded(child: ElevatedButton(
                        child: Text('Back'),

                        onPressed: details.onStepCancel,

                      ),

                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  if(currentStep ==1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Not sure? "),
                        TextButton(
                            onPressed: () async {
                              await getClimateValues();
                            },
                            child: Text(
                              "Automate these values",
                              style: TextStyle(
                                  color: mayGreen,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        )
                      ],
                    ),
                  if(currentStep ==2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Not sure? "),
                        TextButton(
                            onPressed: (){
                              inAppBrowser(soilHealthCard);
                            },
                            child: Text(
                              "Get my soil card.",
                              style: TextStyle(
                                  color: mayGreen,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        )
                      ],
                    ),
                ],
              ),
            );
          },
          ),


          ),
        );
  }

  Widget statesDropdown(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(15),
      //     border: Border.all(
      //       color: Colors.black.withOpacity(0.2),
      //       style: BorderStyle.solid,
      //       width: 1.5,
      //     )),
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: DropdownButton<String>(
        underline: const SizedBox(),
        isExpanded: true,
        value: currentState.toUpperCase(),
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        icon: Icon(Icons.arrow_drop_down_rounded),
        style: const TextStyle(color: Colors.black),
        //iconEnabledColor: headline2Color,
        items: allStatesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.black, fontSize: 16),
            ),
          );
        }).toList(),
        selectedItemBuilder: (context) {
          return allStatesList.map((e) {
            return Row(
              children: [
                Icon(
                  Icons.house,
                  //color: headline2Color,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  e,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            );
          }).toList();
        },
        hint: Row(
          children: [
            Icon(
              Icons.house,
              //color: headline2Color,
            ),
            SizedBox(
              width: 16,
            ),
            const Text(
              "Select State",
              style: TextStyle(
                //color: headline2Color,
                fontSize: 16,
              ),
            ),
          ],
        ),
        onChanged: (String? value) {
          setState(() {
            currentState = value!;
            currentDistrict = allStatesAndDistrictsMap[currentState]![0];
            districtsList = allStatesAndDistrictsMap[currentState];
          });
        },
      ),
    );
  }

  Widget districtsDropdown(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(15),
      //     border: Border.all(
      //       color: Colors.black.withOpacity(0.2),
      //       style: BorderStyle.solid,
      //       width: 1.5,
      //     )),
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: DropdownButton<String>(
        underline: const SizedBox(),
        isExpanded: true,
        value: currentDistrict.toUpperCase(),
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        icon: Icon(Icons.arrow_drop_down_rounded),
        style: const TextStyle(color: Colors.black),
        //iconEnabledColor: headline2Color,
        items: districtsList!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.black, fontSize: 16),
            ),
          );
        }).toList(),
        selectedItemBuilder: (context) {
          return districtsList!.map((e) {
            return Row(
              children: [
                Icon(
                  Icons.other_houses,
                  //color: headline2Color,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  e,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            );
          }).toList();
        },
        hint: Row(
          children: [
            Icon(
              Icons.other_houses,
              //color: headline2Color,
            ),
            SizedBox(
              width: 16,
            ),
            const Text(
              "Select District",
              style: TextStyle(
                //color: headline2Color,
                fontSize: 16,
              ),
            ),
          ],
        ),
        onChanged: (String? value) {
          setState(() {
            currentDistrict = value!;
          });
        },
      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: Text('Location'),
      content: Form(
        key: formkey,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('State:',
                style: TextStyle(fontSize: 18,),
              ),
              const SizedBox(height: 15.0,
              ),
              statesDropdown(),
              // Container(
              //   child:
              //     TextFormField(
              //       controller: stateTextEditingController,
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           return 'Please enter state';
              //         }
              //         return null;
              //       },
              //       decoration: InputDecoration(
              //         suffixIcon: Icon(Icons.house),
              //         hintText: 'Enter your State',
              //         hintStyle: TextStyle(color: Colors.black87,),
              //         contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0) ,
              //       ),
              //     ),
              //   // TextField(
              //   //
              //   //   decoration: InputDecoration(
              //   //     border: InputBorder.none,
              //   //     suffixIcon: Icon(Icons.house),
              //   //     hintText: 'Enter Your State',
              //   //     hintStyle: TextStyle(color: white,),
              //   //     contentPadding: EdgeInsets.all(15.0),
              //   //   ),
              //   // ),
              // ),
              const SizedBox(height: 20.0,
              ),
              Text('District:',
                style: TextStyle(fontSize: 18,),
              ),
              const SizedBox(height: 15.0,
              ),
              districtsDropdown(),
              // Container(
              //   child: TextFormField(
              //     controller: districtTextEditingController,
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Please enter state';
              //       }
              //       return null;
              //     },
              //     decoration: InputDecoration(
              //       suffixIcon: Icon(Icons.other_houses),
              //       hintText: 'Enter Your District',
              //       hintStyle: TextStyle(color: Colors.black87,),
              //       contentPadding: EdgeInsets.all(15.0),
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),

    ),
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 1,

      title: Text('Weather Details'),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Temperature:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: temperatureTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.local_fire_department),
                  hintText: 'Enter the Temperature',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0,
            ),
            Text('Humidity:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: humidityTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_on),
                  hintText: 'Enter the Humidity',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            SizedBox(height: 15,
            ),
            Text('Rainfall:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: rainfallTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.water),
                  hintText: 'Enter the Rainfall',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),

          ],
        ),
      ),

    ),
    Step(
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 2,

      title: Text('Soil Constitution'),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('N:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: nTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_sharp),
                  hintText: 'Enter the Nitrogen Level',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0,
            ),
            Text('P:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: pTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_sharp),
                  hintText: 'Enter the Phosphorous Level',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            SizedBox(height: 15,
            ),
            Text('K:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: kTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_sharp),
                  hintText: 'Enter the Potassium Level',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            const SizedBox(height: 15.0,
            ),
            Text('pH:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: phTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_sharp),
                  hintText: 'Enter the pH',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),

          ],
        ),
      ),

    ),
    Step(
      state: currentStep > 3 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 3,

      title: Text('Personal Preference'),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Budget per kg yield:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: budgetTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.money),
                  hintText: 'Enter your Budget',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0,
            ),
            Text('Area (in hectares):',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: areaTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  suffixIcon: Icon(Icons.area_chart),
                  hintText: 'Enter your Area',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            SizedBox(height: 15,)
            // Text('Other Details:',
            //   style: TextStyle(fontSize: 18,),
            // ),
            // const SizedBox(height: 15.0,
            // ),
            // Form(
            //   child: Container(
            //     child: TextField(
            //       controller: otherTextEditingController,
            //       decoration: InputDecoration(
            //         //border: InputBorder.none,
            //         suffixIcon: Icon(Icons.details),
            //         hintText: 'Enter the Other Details',
            //         hintStyle: TextStyle(color: Colors.black87,),
            //         contentPadding: EdgeInsets.all(15.0),
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    ),
  ];

  buildCompleted() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text("Your land is most suited to grow the following: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          SizedBox(height: 30,),
          recommendedCropsList.length == 0 ? Container() :
          Container(
            height: 444,
            child: ListView.builder(
              itemCount: recommendedCropsList.length,
                itemBuilder: (BuildContext context, int index){
                  return CropCard(crop: recommendedCropsList[index], context: context);
                }
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () => setState((){
            isCompleted = false;
            currentStep = 0;
          })
            , child: Text('RESET'),),
        ],
      ),
    );
  }
}

