import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';

class FarmersChat extends StatefulWidget {
  const FarmersChat({Key? key}) : super(key: key);

  @override
  _FarmersChatState createState() => _FarmersChatState();
}

class _FarmersChatState extends State<FarmersChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hunterGreen,
        title: Text('Chat'),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Helpful stuff of course'),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text('Did'),
      ),
    );
    ;
  }
}
