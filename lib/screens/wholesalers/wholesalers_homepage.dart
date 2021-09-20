import 'package:fasal/services/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fasal/constants/constants.dart';
import 'wholesalers_chat.dart';
import 'wholesalers_profile.dart';
import 'view_farmers.dart';
import 'search_farmers.dart';

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
    WholesalersProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: eggShell,
        title: Text('Appbar'),
      ),
      //needs to be worked on!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Helpful stuff ofcourse'),
            ],
          ),
        ),
      ),
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
