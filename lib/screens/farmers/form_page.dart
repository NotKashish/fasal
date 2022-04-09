import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/drawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormPage extends StatefulWidget {

   FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int currentStep = 0;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mayGreen,

        title: Text('Form Page'),

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
          onStepContinue: (){
            final isLastStep = currentStep == getSteps().length - 1;
            if(isLastStep){
              setState(() => isCompleted = true);
              print('Completed');
              //send data
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepTapped: (step) => setState(() => currentStep = step),
          onStepCancel:
              currentStep == 0 ? null : ()=> setState(() => currentStep -= 1),
          controlsBuilder: (BuildContext context, ControlsDetails details){
            final isLastStep = currentStep == getSteps().length -1;
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(child: ElevatedButton(
                    child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
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
      title: Text('One'),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('State:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child:
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.house),
                    hintText: 'Enter your State',
                    hintStyle: TextStyle(color: Colors.black87,),
                    contentPadding: EdgeInsets.all(15.0),
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
            Text('District:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
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
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 1,

      title: Text('Two'),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Temperature:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.local_fire_department),
                  hintText: 'Enter the Temperature',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0,
            ),
            Text('Humidity:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_on),
                  hintText: 'Enter the Humidity',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            SizedBox(height: 15,
            ),
            Text('Rainfall:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
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

      title: Text('Three'),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('N:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_sharp),
                  hintText: 'Enter the Nitrogen Level',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0,
            ),
            Text('P:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_sharp),
                  hintText: 'Enter the Phosphorous Level',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            SizedBox(height: 15,
            ),
            Text('K:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.invert_colors_sharp),
                  hintText: 'Enter the Potassium Level',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            const SizedBox(height: 15.0,
            ),
            Text('pH:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
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

      title: Text('Four'),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Budget:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.money),
                  hintText: 'Enter your Budget',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0,
            ),
            Text('Area:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.area_chart),
                  hintText: 'Enter your Area',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            SizedBox(height: 15,
            ),
            Text('Other Details:-',
              style: TextStyle(fontSize: 18,),
            ),
            const SizedBox(height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: androidGreen,
                borderRadius:  BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.details),
                  hintText: 'Enter the Other Details',
                  hintStyle: TextStyle(color: Colors.black87,),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),

          ],
        ),
      ),
    ),
  ];

  buildCompleted() {
    return Container(
      child: Column(
        children: [
          Text("confirmed, you will get your results now!!!"),
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

