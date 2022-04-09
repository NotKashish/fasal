import 'package:fasal/constants/all_crops.dart';
import 'package:fasal/services/mlapi_services.dart';
import 'package:fasal/widgets/crop_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../models/crop.dart';
import '../../widgets/drawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormPage extends StatefulWidget {

   FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  MlApiServices _mlApiServices = MlApiServices();

  int currentStep = 0;
  bool isCompleted = false;
  List<Crop> recommendedCropsList = [];
  final formkey = GlobalKey<FormState>();

  TextEditingController stateTextEditingController = TextEditingController();
  TextEditingController districtTextEditingController = TextEditingController();
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
      "state": stateTextEditingController.text,
      "district": districtTextEditingController.text,
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
    if(rainfall!="Something went wrong, please try again."){
      setState(() {
        rainfallTextEditingController.text = rainfall;
        temperatureTextEditingController.text = '25.8';
        humidityTextEditingController.text = '6.7';
      });
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
                            onPressed: details.onStepContinue,
                            child: Text(
                              "Skip",
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
              Container(
                child:
                  TextFormField(
                    controller: stateTextEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter state';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.house),
                      hintText: 'Enter your State',
                      hintStyle: TextStyle(color: Colors.black87,),
                      contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0) ,
                    ),
                  ),
                // TextField(
                //
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     suffixIcon: Icon(Icons.house),
                //     hintText: 'Enter Your State',
                //     hintStyle: TextStyle(color: white,),
                //     contentPadding: EdgeInsets.all(15.0),
                //   ),
                // ),
              ),
              const SizedBox(height: 20.0,
              ),
              Text('District:',
                style: TextStyle(fontSize: 18,),
              ),
              const SizedBox(height: 15.0,
              ),
              Container(
                child: TextFormField(
                  controller: districtTextEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter state';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.other_houses),
                    hintText: 'Enter Your District',
                    hintStyle: TextStyle(color: Colors.black87,),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),

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
            Text('Budget:',
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
            Text('Area:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              child: TextField(
                controller: areaTextEditingController,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  //suffixIcon: Icon(Icons.area_chart),
                  hintText: 'Enter your Area',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            SizedBox(height: 15,
            ),
            Text('Other Details:',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Form(
              child: Container(
                child: TextField(
                  controller: otherTextEditingController,
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    suffixIcon: Icon(Icons.details),
                    hintText: 'Enter the Other Details',
                    hintStyle: TextStyle(color: Colors.black87,),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
            ),

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

