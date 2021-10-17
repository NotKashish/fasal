import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/screens/farmers/farmers_chat.dart';
import 'package:fasal/screens/farmers/upload_produce.dart';
import 'package:fasal/screens/farmers/view_wholesalers.dart';
import 'package:fasal/screens/profile_page.dart';

import 'drawer.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  _PriceState createState() => _PriceState();
}

int currentIndex = 0;
final screens = [
  FarmersChat(),
  UploadProduce(),
  ViewWholesalers(),
  ProfilePage(),
];

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hunterGreen,
        title: Text('Market Prices'),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Text(
          'Apple (Apple)	1 Kg	220.00 \nAvocado (Avocado Palam)	1 Kg	180.00\nBlack Grape (Karuppu Thiratchai)	1 Kg	80.00\nCherry (Cherry Palam)	1 Kg	600.00\nCoconut (Thengai)	1 Piece	30.00\nCustard Apple (Seethapalam)	1 Kg	140.00\nDate (Pericham Palam)	1 Kg	480.00\nFig (Athipalam)	1 Kg	180.00\nGooseberry (Nellikai)	1 Kg	220.00\nGreen Banana (Pachai Valaipalam)	1 Kg	60.00Green Grape (Pachai Thiratchai)	1 Kg	80.00\nJackfruit (Palapalam)	1 Kg	170.00\nLemon (Elumichai)	1 Kg	175.00\nMango (Mambalam)	1 Kg	70.00\nMosambi (Sathukudi Palam)	1 Kg	60.00\nOrange (Orange)	1 Kg	70.00\nPapaya (Pappali Palam)	1 Kg	90.00\nPeach (Peach Palam)	1 Kg	230.00\nPear (Berikai)	1 Kg	185.00\nPineapple (Annachi Palam)	1 Kg	90.00\nPlum (Plums Palam)	1 Kg	280.00\nPomegranate (Mathulai Palam)	1 Kg	130.00\nSapota (Sapota Palam)	1 Kg	90.00\nStrawberry (Strawberry)	1 Kg	420.00\nWatermelon (Watermelon)	1 Kg	25.00\n Yellow Banana (Manjal Valaipalam)	1 Kg	65.00',
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
