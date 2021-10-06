import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';
import 'package:fasal/constants/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WholesalersProfile extends StatefulWidget {
  const WholesalersProfile({Key? key}) : super(key: key);

  @override
  _WholesalersProfileState createState() => _WholesalersProfileState();
}

class _WholesalersProfileState extends State<WholesalersProfile> {
  void getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.get(UID_KEY);
    _pref.get(NAME_KEY);
    _pref.get(EMAIL_KEY);
    _pref.get(PHONE_KEY);
    _pref.get(AADHAR_KEY);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
              Text('Helpful stuff of course'),
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
            NAME_KEY,
            style: TextStyle(
              color: androidGreen,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () {
// context.read<AuthenticationService>().signOut();
// },
// child: Text(
// 'SignOut',
// ),
// ),
