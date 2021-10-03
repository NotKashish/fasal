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
        child: Text('haa'),
      ),
    );
    ;
  }
}
