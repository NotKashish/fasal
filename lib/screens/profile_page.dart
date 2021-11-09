import 'package:fasal/constants/constants.dart';
import 'package:fasal/constants/keys.dart';
import 'package:fasal/helper/shared_preferences_helper.dart';
import 'package:fasal/services/authentication_services.dart';
import 'package:fasal/widgets/drawer.dart';
import 'package:fasal/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String userName = "";
  String userEmail = "";
  String userPhone = "";
  String userAadhar = "";
  String userRegion = "";

  void getData() async {
    getNameFromPrefs().then((value){
      setState(() {
        userName = value!;
      });
    });
    getEmailFromPrefs().then((value){
      setState(() {
        userEmail = value!;
      });
    });
    getPhoneFromPrefs().then((value){
      setState(() {
        userPhone = value!;
      });
    });
    getAadharFromPrefs().then((value){
      setState(() {
        userAadhar = value!;
      });
    });
    getRegionFromPrefs().then((value){
      setState(() {
        userRegion = value!;
      });
    });
  }

  @override
  void initState() {
    getData();
    print("-" * 80);
    print("$userName\n$userEmail\n$userPhone\n");
    print("-" * 80);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: androidGreen,
      ),
      drawer: MyDrawer(),
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
          buildPhone(),
          const SizedBox(
            height: 18.0,
          ),
          buildAadhar(),
          const SizedBox(
            height: 18.0,
          ),
          buildRegion(),
          const SizedBox(
            height: 60.0,
          ),
          InkWell(
            onTap: () {
              context.read<AuthenticationService>().signOut();
            },
            child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              // padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: 60.0,
              height: 50.0,
              decoration: new BoxDecoration(
                color: deepChestnut,
                borderRadius: new BorderRadius.circular(20.0),
              ),
              child: new Center(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            userName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(height: 6),
          Text(
            userEmail,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          )
        ],
      );

  Widget buildPhone() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              userPhone,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildAadhar() => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aadhar Number',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          userAadhar,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

  Widget buildRegion() => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Region',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          userRegion,
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
