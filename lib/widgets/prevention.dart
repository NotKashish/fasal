import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/screens/farmers/farmers_chat.dart';
import 'package:fasal/screens/farmers/upload_produce.dart';
import 'package:fasal/screens/farmers/view_wholesalers.dart';
import 'package:fasal/screens/profile_page.dart';

import 'drawer.dart';

class Prevention extends StatefulWidget {
  const Prevention({Key? key}) : super(key: key);

  @override
  _PreventionState createState() => _PreventionState();
}

// int currentIndex = 0;
// final screens = [
//   FarmersChat(),
//   UploadProduce(),
//   ViewWholesalers(),
//   ProfilePage(),
// ];

class _PreventionState extends State<Prevention> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: eggShell,
      appBar: AppBar(
        backgroundColor: androidGreen,
        title: Text('Tips to keep fruits fresh'),
      ),
      // drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              fit: BoxFit.fill,
              // height: 200,
              // width: 200,
              image: AssetImage('assets/images/93591.jpg'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              shadowColor: Colors.black87,
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '1. Don’t refrigerate.'
                  '\n\n2. Store in a cool, dark place with relatively high humidity.'
                  '\n\n3. Allow air circulation.'
                  '\n\n4. Keep separate from onions, bananas, and other ethylene-producing items.',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              color: eggShell,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// 'Don’t refrigerate.Store in a cool, dark place with relatively high humidity.Allow air circulation.
// Keep separate from onions, bananas, and other ethylene-producing items.Whether they’re star'
