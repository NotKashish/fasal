import 'package:fasal/helper/shared_preferences_helper.dart';
import 'package:fasal/widgets/prevention.dart';
import 'package:fasal/widgets/price.dart';
import 'package:flutter/material.dart';

import 'about_us.dart';
import 'helpline.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String userName = "";
  String userEmail = "";

  getData() async {
    getNameFromPrefs().then((value) {
      setState(() {
        userName = value!;
      });
    });
    getEmailFromPrefs().then((value) {
      setState(() {
        userEmail = value!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green[700]),
            accountName: Text(userName),
            accountEmail: Text(userEmail),
          ),
          ListTile(
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Price(),
                ),
              );
            },
            leading: Icon(Icons.payments),
            title: Text('Market prices'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Helpline(),
                ),
              );
            },
            leading: Icon(Icons.phone),
            title: Text('Kissan Helpline numbers'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Prevention(),
                ),
              );
            },
            leading: Icon(Icons.question_answer),
            title: Text('How to take care of various fruit crops'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              );
            },
            leading: Icon(Icons.contact_support),
            title: Text('About us'),
          ),
        ],
      ),
    );
  }
}
