import 'package:fasal/constants/constants.dart';
import 'package:fasal/screens/authentication/signup.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_textfield.dart';

class SignIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        backgroundColor: eggShell,
        appBar: AppBar(
          backgroundColor: androidGreen,
          title: Text(
            'Fasal',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const SizedBox(
            //   height: 0,
            // ),
            Image(
              fit: BoxFit.fill,
              // height: 200,
              // width: 200,
              image: AssetImage('assets/31110.jpg'),
            ),
            const SizedBox(height: 35),
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
            const SizedBox(
              height: 60.0,
            ),
            InkWell(
              onTap: () {
                context.read<AuthenticationService>().signIn(
                    emailController.text.trim(),
                    passwordController.text.trim());
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
                    'Sign In',
                    style: TextStyle(
                      fontSize: 25.0, color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
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
                      fontSize: 25.0, color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     context.read<AuthenticationService>().signIn(
            //         emailController.text.trim(), passwordController.text.trim());
            //   },
            //   child: Text("Sign In"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => SignUp()),
            //     );
            //   },
            //   child: Text("Sign up Page"),
            // ),
          ],
        ),
      ),
    );
  }
}
