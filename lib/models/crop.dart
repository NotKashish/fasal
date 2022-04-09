import 'package:flutter/material.dart';

class Crop {
  Crop({
    this.uid = "",
    required this.name,
    this.photo = "",
    this.description = "",
    this.price = "",
  });

  String uid;
  String name;
  String photo;
  String description;
  String price;
}
