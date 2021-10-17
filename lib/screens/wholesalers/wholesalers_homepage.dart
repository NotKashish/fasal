import 'package:fasal/constants/constants.dart';
import 'package:fasal/constants/keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'search_farmers.dart';
import 'view_farmers.dart';
import 'wholesalers_chat.dart';
import '../profile_page.dart';

class WholesalerHomepage extends StatefulWidget {
  const WholesalerHomepage({Key? key}) : super(key: key);

  @override
  _WholesalerHomepageState createState() => _WholesalerHomepageState();
}

class _WholesalerHomepageState extends State<WholesalerHomepage> {
  int currentIndex = 0;
  final screens = [
    WholesalersChat(),
    SearchFarmers(),
    ViewFarmers(),
    ProfilePage(),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            icon: Icon(Icons.search),
            label: 'Search',
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
