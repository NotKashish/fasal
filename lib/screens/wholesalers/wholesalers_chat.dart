import 'package:fasal/constants/constants.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          children: [
            Text('hello'),
          ],
        ),
      ),
    );
  }
}
