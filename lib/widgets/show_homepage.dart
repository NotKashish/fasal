import 'package:fasal/screens/authentication/loading_page.dart';
import 'package:fasal/screens/farmers/farmers_homepage.dart';
import 'package:fasal/screens/wholesalers/wholesalers_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowHomePage extends StatelessWidget {
  const ShowHomePage({
    Key? key,
    required this.collectionReference,
    required this.firebaseUser,
  }) : super(key: key);

  final CollectionReference<Object?> collectionReference;
  final User? firebaseUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: collectionReference.doc(firebaseUser!.uid).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError)
            return LoadingPage(icon: Icons.warning, text: 'Something went wrong');
          if (snapshot.hasData && !snapshot.data!.exists)
            return LoadingPage(icon: Icons.warning, text: 'User does not exist');
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<
                String,
                dynamic>;
            if (data['type'] == 'farmer')
              return FarmersHomepage();
            if (data['type'] == 'wholesaler')
              return WholesalerHomepage();
          }
          return LoadingPage(icon: Icons.circle, text: 'Loading');
        });
  }
}