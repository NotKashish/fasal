import 'package:fasal/constants/constants.dart';
import 'package:fasal/constants/keys.dart';
import 'package:fasal/helper/shared_preferences_helper.dart';
import 'package:fasal/models/farmer.dart';
import 'package:fasal/screens/farmers/farmers_chat.dart';
import 'package:fasal/screens/farmers/form_page.dart';
import 'package:fasal/screens/farmers/upload_produce.dart';
import 'package:fasal/screens/farmers/view_wholesalers.dart';
import 'package:fasal/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../authentication/loading_page.dart';

class FarmersHomepage extends StatefulWidget {
  FarmersHomepage({
    Key? key,
    required this.farmer,
  }) : super(key: key);

  Farmer farmer;

  @override
  State<FarmersHomepage> createState() => _FarmersHomepageState();
}

class _FarmersHomepageState extends State<FarmersHomepage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  int currentIndex = 0;
  final screens = [
    FormPage(),
    ViewWholesalers(),
    UploadProduce(),

    //FarmersChat(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setValues(widget.farmer.uid, widget.farmer.name,
          widget.farmer.email, widget.farmer.phoneNo,
          widget.farmer.aadharNo, widget.farmer.region),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if(snapshot.hasError) {
          return LoadingPage(
              icon: Icons.warning, text: 'Something went wrong');
        } else if (snapshot.hasData && !snapshot.data!) {
          return LoadingPage(
              icon: Icons.warning, text: 'User does not exist');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return buildFarmerHomePage();
        }
        return LoadingPage(icon: Icons.circle, text: 'Loading');     },
    );
  }

  buildFarmerHomePage() {
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
            icon: Icon(Icons.pages),
            label: 'Crops',
            backgroundColor: mayGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'View',
            backgroundColor: oliveGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_rounded),
            label: 'Upload',
            backgroundColor: mayGreen,
          ),


          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chat',
          //   backgroundColor: hunterGreen,
          // ),
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
