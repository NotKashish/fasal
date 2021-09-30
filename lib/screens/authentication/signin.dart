import 'package:fasal/constants/constants.dart';
import 'package:fasal/screens/authentication/signup.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text('Fasal'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Enter Email",
              labelText: "Email",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter password",
              labelText: "Password",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                  emailController.text.trim(), passwordController.text.trim());
            },
            child: Text("Sign In"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Text("Sign up Page"),
          )
        ],
      ),
    );
  }
}

