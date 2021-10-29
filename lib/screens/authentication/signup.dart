import 'package:fasal/screens/authentication/signin.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../../constants/constants.dart';
import '../../widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //Init
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();

  bool farmer = true;
  String type = 'farmer';
  String region = "Maharashtra";

  void toggleSwitch(bool value) {
    if (farmer) {
      setState(() {
        farmer = false;
        type = 'wholesaler';
      });
    } else {
      setState(() {
        farmer = true;
        type = 'farmer';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: eggShell,
        body: SingleChildScrollView(
          child: Column(children: [
            // SizedBox(height: 5),
            Image(
              fit: BoxFit.fill,
              // height: 200,
              // width: 200,
              image: AssetImage('assets/images/31110.jpg'),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              type.replaceFirst(type[0], type[0].toUpperCase()),
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            CupertinoSwitch(
              activeColor: androidGreen,
              value: farmer,
              onChanged: toggleSwitch,
            ),
            // Switch(
            //   value: farmer,
            //   onChanged: toggleSwitch,
            // ),
            CustomTextField(
              controller: emailController,
              hintText: 'Enter your E-mail',
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
            CustomTextField(
              controller: passwordController,
              hintText: 'Enter your Password',
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.black87,
              ),
              obscureText: true,
            ),
            CustomTextField(
              controller: nameController,
              hintText: 'Enter your full name',
              labelText: 'Full name',
              labelStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
            CustomTextField(
              controller: phoneController,
              hintText: 'Enter your phone no',
              labelText: 'Phone Number',
              labelStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
            CustomTextField(
              controller: aadharController,
              hintText: 'Enter your aadhar no',
              labelText: 'Aadhar Number',
              labelStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
            DropdownButton<String>(
              value: region,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  region = newValue!;
                });
              },
              items: <String>[
                'Maharashtra',
                'Gujarat',
                'Tamil Nadu',
                'Rajasthan',
                'Goa'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 25.0,
            ),
            //SIGN UP BUTTON
            InkWell(
              onTap: () {
                context
                    .read<AuthenticationService>()
                    .signup(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      type,
                      nameController.text.trim(),
                      phoneController.text.trim(),
                      aadharController.text.trim(),
                      region,
                    );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => SignIn()),
                );
              },
              child: new Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0),
                // width: 60.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: androidGreen,
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: new Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 22.0, color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
