import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanged => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<String> signup(String email, String password, String type, String name,
      String phoneNo, String aadharNo, String region) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = _firebaseAuth.currentUser;
      String uid = user!.uid;
      await _collectionReference.doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'phone_no': phoneNo,
        'aadhar_no': aadharNo,
        'type': type,
        'region': region,
      });
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }
}
