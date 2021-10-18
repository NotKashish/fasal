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
      appBar: AppBar(
        backgroundColor: hunterGreen,
        title: Text('About us'),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Text(
          'we the students of shah and anchor kutchhi enginerring college,started this for betterment of farmers',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
