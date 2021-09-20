import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';

class ViewFarmers extends StatefulWidget {
  const ViewFarmers({Key? key}) : super(key: key);

  @override
  _ViewFarmersState createState() => _ViewFarmersState();
}

class _ViewFarmersState extends State<ViewFarmers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View'),
        backgroundColor: oliveGreen,
      ),
      body: Center(
        child: Text('haa'),
      ),
    );
    ;
  }
}
