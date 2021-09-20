import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';

class WholesalersProfile extends StatefulWidget {
  const WholesalersProfile({Key? key}) : super(key: key);

  @override
  _WholesalersProfileState createState() => _WholesalersProfileState();
}

class _WholesalersProfileState extends State<WholesalersProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: androidGreen,
      ),
      body: Center(
        child: Text('aaaaah, mo yameteee..'),
      ),
    );
    ;
  }
}
