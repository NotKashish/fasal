import 'package:fasal/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmersHomepage extends StatelessWidget {
  const FarmersHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hey Milloni, with double L, you are a farmer"),
            ElevatedButton(onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
              child: Text('SignOut',),),
          ],
        ),
      ),
    );
  }
}
