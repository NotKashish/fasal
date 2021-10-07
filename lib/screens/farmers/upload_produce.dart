import 'package:fasal/constants/constants.dart';
import 'package:flutter/material.dart';

class UploadProduce extends StatefulWidget {
  const UploadProduce({Key? key}) : super(key: key);

  @override
  _UploadProduceState createState() => _UploadProduceState();
}

class _UploadProduceState extends State<UploadProduce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Produce'),
        backgroundColor: mayGreen,
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
        child: Text('some work for you'),
      ),
    );
  }
}
