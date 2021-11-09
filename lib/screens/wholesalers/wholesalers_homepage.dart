import 'package:fasal/constants/constants.dart';
import 'package:fasal/constants/keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'search_farmers.dart';
import 'view_farmers.dart';
import 'wholesalers_chat.dart';
import '../profile_page.dart';
import '../../models/wholesaler.dart';
import '../../helper/shared_preferences_helper.dart';
import '../authentication/loading_page.dart';

// ignore: must_be_immutable
class WholesalerHomepage extends StatefulWidget {
  WholesalerHomepage({
      Key? key,
      required this.wholesaler,
    }) : super(key: key);

  Wholesaler wholesaler;

  @override
  _WholesalerHomepageState createState() => _WholesalerHomepageState();
}

class _WholesalerHomepageState extends State<WholesalerHomepage> {
  int currentIndex = 0;
  final screens = [
    ViewFarmers(),
    WholesalersChat(),
    ProfilePage(),
  ];

  @override
  void initState() {
    //TODO: Initialize widget
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setValues(widget.wholesaler.uid, widget.wholesaler.name, widget.wholesaler.email,
          widget.wholesaler.phoneNo, widget.wholesaler.aadharNo, widget.wholesaler.region),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if(snapshot.hasError) {
          return LoadingPage(
              icon: Icons.warning, text: 'Something went wrong');
        } else if (snapshot.hasData && !snapshot.data!) {
          return LoadingPage(
              icon: Icons.warning, text: 'User does not exist');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return buildWholesalerHomePage();
        }
        return LoadingPage(icon: Icons.circle, text: 'Loading');     },
    );
  }

  buildWholesalerHomePage() {
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chat',
          //   backgroundColor: hunterGreen,
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'View',
            backgroundColor: oliveGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: hunterGreen,
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
