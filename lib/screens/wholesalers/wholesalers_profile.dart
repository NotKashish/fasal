import 'package:fasal/constants/constants.dart';
import 'package:fasal/constants/keys.dart';
import 'package:fasal/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 15.0,
          ),
          ProfileWidget(
            imagePath:
                'https://i.pinimg.com/originals/0a/6c/ae/0a6caeadd01eb5d9ca8ebb69d71c1fed.jpg',
            onClicked: () async {},
          ),
          const SizedBox(
            height: 18.0,
          ),
          buildName(),
          const SizedBox(
            height: 18.0,
          ),
          buildAbout(),
        ],
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            NAME_KEY,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(height: 6),
          Text(
            EMAIL_KEY,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          )
        ],
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Long ago, the four nations lived together in harmony. Then, everything changed when the Fire Nation attacked. Only the Avatar, master of all four elements, could stop them, but when the world needed him most, he vanished. A hundred years passed and my brother and I discovered the new Avatar, an airbender named Aang.',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

// ElevatedButton(
// onPressed: () {
// context.read<AuthenticationService>().signOut();
// },
// child: Text(
// 'SignOut',
// ),
// ),
