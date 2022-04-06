import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/drawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormPage extends StatelessWidget {
   FormPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: eggShell,
      appBar: AppBar(
        title: Text('Form'),
        backgroundColor: oliveGreen,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: FormBuilder(key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 15.0,),
            Text('Soil Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('Temperature:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'Temperature',),
                fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('Humidity:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'Humidity',),
                  fit: FlexFit.loose,),
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('N:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'N',),
                  fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('P:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'P',),
                  fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('K:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'K',),
                  fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('pH:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'pH',),
                  fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 20.0,),
            Text('Additional Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('Budget:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'Budget',),
                  fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('Area:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'Area',),
                  fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('State:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'State',),
                  fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                SizedBox(width: 10,),
                Flexible(child: Text('District:',style: TextStyle(fontSize: 18,),),),
                SizedBox(width: 10,),
                Flexible(child: FormBuilderTextField(name: 'District',),
                  fit: FlexFit.loose,),

              ],
            ),
            SizedBox(height: 20.0,),

            ElevatedButton(onPressed: (){}, child: Text('Submit'),),
          ],
        ),
        ),
      ),
    );
  }
}
