import 'package:fasal/constants/constants.dart';
import 'package:fasal/constants/keys.dart';
import 'package:fasal/screens/farmers/farmers_chat.dart';
import 'package:fasal/screens/farmers/upload_produce.dart';
import 'package:fasal/screens/farmers/view_wholesalers.dart';
import 'package:fasal/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmersHomepage extends StatefulWidget {
  const FarmersHomepage({Key? key}) : super(key: key);

  @override
  State<FarmersHomepage> createState() => _FarmersHomepageState();
}

class _FarmersHomepageState extends State<FarmersHomepage> {
  void getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    print(_pref.get(UID_KEY));
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  int currentIndex = 0;
  final screens = [
    FarmersChat(),
    UploadProduce(),
    ViewWholesalers(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        showUnselectedLabels: false,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: hunterGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
            backgroundColor: mayGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'View',
            backgroundColor: oliveGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: androidGreen,
          ),
        ],
      ),
    );
  }
}
