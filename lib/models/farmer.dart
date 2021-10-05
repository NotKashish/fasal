import 'dart:convert';

Farmer farmerFromMap(Map<String, dynamic> data) => Farmer.fromMap(data);

class Farmer {

  Farmer({
    required this.uid,
    required this.name,
    required this.email,
    required this.aadharNo,
    required this.phoneNo,
  });

  String uid;
  String name;
  String email;
  String phoneNo;
  String aadharNo;

  factory Farmer.fromMap(Map<String, dynamic> map) =>
      Farmer(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        aadharNo: map['aadhar_no'],
        phoneNo: map['phone_no'],
      );
}