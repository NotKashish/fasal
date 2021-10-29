import 'package:fasal/constants/constants.dart';
import 'package:fasal/widgets/drawer.dart';
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
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            Text('This is the Chat screen.'),
          ],
        ),
      ),
    );
  }
}
