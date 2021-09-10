import 'package:fasal/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WholesalerHomepage extends StatelessWidget {
  const WholesalerHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hey Mit, you are a wholesaler, I would add something funny "
                "but nothing is coming to mind"),
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
