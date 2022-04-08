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
          colorScheme: ColorScheme.light(primary: androidGreen,),
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
      content: Container(),

    ),
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 1,

      title: Text('Two'),
      content: Container(),

    ),
    Step(
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 2,

      title: Text('Three'),
      content: Container(),

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

