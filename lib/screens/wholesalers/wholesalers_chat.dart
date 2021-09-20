import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';

class WholesalersChat extends StatefulWidget {
  const WholesalersChat({Key? key}) : super(key: key);

  @override
  _WholesalersChatState createState() => _WholesalersChatState();
}

class _WholesalersChatState extends State<WholesalersChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hunterGreen,
        title: Text('Chat'),
      ),
      body: Center(
        child: Text('Kame'),
      ),
    );
  }
}
