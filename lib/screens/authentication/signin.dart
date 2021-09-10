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
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),

          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password"
            ),
          ),

          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>()
                  .signIn(emailController.text.trim(),
                    passwordController.text.trim());

            },
            child: Text("Sign In"),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUp()),);
            },
            child: Text("Sign up Page"),
          )
        ],
      ),
    );
  }
}
