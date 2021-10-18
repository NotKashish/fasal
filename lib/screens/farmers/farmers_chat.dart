import 'package:fasal/constants/constants.dart';
import 'package:fasal/widgets/drawer.dart';
import 'package:flutter/material.dart';

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
      drawer: MyDrawer(),
      body: Center(
        child: Text('This is the chat screen.'),
      ),
    );
  }
}
