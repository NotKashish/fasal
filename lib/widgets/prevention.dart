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

int currentIndex = 0;
final screens = [
  FarmersChat(),
  UploadProduce(),
  ViewWholesalers(),
  ProfilePage(),
];

class _PreventionState extends State<Prevention> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hunterGreen,
        title: Text('Tips to stay fruits fresh'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Don’t refrigerate.Store in a cool, dark place with relatively high humidity.Allow air circulation.Keep separate from onions, bananas, and other ethylene-producing items.Whether they’re star'),
      ),
      // body: IndexedStack(
      //   index: currentIndex,
      //   children: screens,
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) => setState(() => currentIndex = index),
      //   showUnselectedLabels: false,
      //   iconSize: 28,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'Chat',
      //       backgroundColor: hunterGreen,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.upload),
      //       label: 'Upload',
      //       backgroundColor: mayGreen,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       label: 'View',
      //       backgroundColor: oliveGreen,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //       backgroundColor: androidGreen,
      //     ),
      //   ],
      // ),
    );
  }
}
