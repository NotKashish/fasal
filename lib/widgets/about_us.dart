import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';

import 'drawer.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: eggShell,
      appBar: AppBar(
        backgroundColor: androidGreen,
        title: Text('About us'),
      ),
      // drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FASAL - TE Sem V Mini-Project',
                style: TextStyle(
                  fontSize: 31.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Team Members '
                '\n -Milloni Gada'
                '\n -Kashish Maru'
                '\n -Mit Sheth'
                '\n -Saivignesh Adepu',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'AIM :-'
                '\n-Our main aim is to create a mobile application for farmers and wholesalers to carry out trade without the intervention of Mandi system.'
                '\n-The application will provide a just price estimation of the fruit '
                'products based on quality assurance checks performed on the image of the product.'
                '\n-To provide a smooth experience, a chatbot guide to help the farmers and wholesalers understand the workings of the app. '
                '\n-Along with this, a chat section to enable the two parties to discuss trades in private.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
