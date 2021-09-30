import 'package:fasal/screens/authentication/signin.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter Email",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter password",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signup(
                  emailController.text.trim(), passwordController.text.trim());
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
    );
  }
}
