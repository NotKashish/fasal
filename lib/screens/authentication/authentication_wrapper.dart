import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasal/screens/authentication/signin.dart';
import 'package:fasal/widgets/show_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {


  @override
  Widget build(BuildContext context) {

    final firebaseUser = context.watch<User?>();
    CollectionReference collectionReference = FirebaseFirestore
        .instance.collection('users');

    if(firebaseUser != null){
      print('-' * 80); 
      print("Auth wrapper");
      print(collectionReference.doc(firebaseUser.uid));
      print('-' * 80);
      return ShowHomePage(
        collectionReference: collectionReference,
        firebaseUser: firebaseUser,
      );
    }
    return SignIn();
  }
}



