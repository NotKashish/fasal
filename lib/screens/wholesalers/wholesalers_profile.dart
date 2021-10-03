import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:provider/provider.dart';

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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              backgroundColor: androidGreen,
              radius: 40.0,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),
          Text(
            'Name',
            style: TextStyle(
              color: androidGreen,
              fontWeight: FontWeight.w900,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text(
              'SignOut',
            ),
          ),
        ],
      ),
    );
    ;
  }
}
