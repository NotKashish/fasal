import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/screens/farmers/farmers_chat.dart';
import 'package:fasal/screens/farmers/upload_produce.dart';
import 'package:fasal/screens/farmers/view_wholesalers.dart';
import 'package:fasal/screens/profile_page.dart';

import 'drawer.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

int currentIndex = 0;
final screens = [
  FarmersChat(),
  UploadProduce(),
  ViewWholesalers(),
  ProfilePage(),
];

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hunterGreen,
        title: Text('About us'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text(
          'we the students of shah and anchor kutchhi enginerring college,started this for betterment of farmers',
          style: TextStyle(fontSize: 16),
        ),
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
