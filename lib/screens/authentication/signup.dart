import 'package:fasal/screens/authentication/signin.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController aadharController = TextEditingController();

  bool farmer = true;

  String type = 'farmer';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text('Fasal'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            Text(
              type,
            ),
            Switch(
              value: farmer,
              onChanged: toggleSwitch,
            ),
            CustomTextField(
              controller: emailController,
              hintText: 'Enter your E-mail',
              labelText: 'Email',
            ),
            CustomTextField(
              controller: passwordController,
              hintText: 'Enter your Password',
              labelText: 'Password',
              obscureText: true,
            ),
            CustomTextField(
              controller: nameController,
              hintText: 'Enter your full name',
              labelText: 'Full name',
            ),
            CustomTextField(
              controller: phoneController,
              hintText: 'Enter your phone no',
              labelText: 'Phone Number',
            ),
            CustomTextField(
              controller: aadharController,
              hintText: 'Enter your aadhar no',
              labelText: 'Aadhar Number',
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signup(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      type,
                      nameController.text.trim(),
                      phoneController.text.trim(),
                      aadharController.text.trim(),
                    );
              },
              child: Text("Sign Up"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: Text("Sign In Page"),
            )
          ],
        ),
      ),
    );
  }
}
