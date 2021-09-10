import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasal/screens/authentication/signin.dart';
import 'package:fasal/screens/farmers/farmers_homepage.dart';
import 'package:fasal/screens/wholesalers/wholesalers_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {

  Future<void> userType() async {
    final firebaseUser = context.watch<User?>();
    if(firebaseUser != null) {
      String? userType;
      CollectionReference users =
      FirebaseFirestore.instance.collection('users');
       var user = users
          .doc(firebaseUser.uid)
          .get();

       //Todo: Idk why it's not working, maybe it'll work for you, who knows flutter is annoying
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    userType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final firebaseUser = context.watch<User?>();
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    if(firebaseUser != null){
      return FutureBuilder<DocumentSnapshot>(
        future: users.doc(firebaseUser.uid).get(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError)
              return Text("Something went wrong");
            if (snapshot.hasData && !snapshot.data!.exists)
              return Text("Document Does not Exist");
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<
                  String,
                  dynamic>;
              if (data['type'] == 'farmer')
                return FarmersHomepage();
              if (data['type'] == 'wholesaler')
                return WholesalerHomepage();
            }
            return Text("Loading");
          });
    }
    return SignIn();
  }
}
