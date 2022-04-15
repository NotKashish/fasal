import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants/keys.dart';

class MlApiServices
{

  Map testData = {
    "N": 90.0.toString(),
    "P": 42.0.toString(),
    "K": 43.0.toString(),
    "temperature": 20.9.toString(),
    "humidity": 82.0.toString(),
    "pH": 6.5.toString(),
    "rainfall": 202.0.toString()
  };

  recommendCrops(Map farmerData) async {
    final response = await http.post(Uri.parse("$uurl/recommend"), body: jsonEncode(farmerData), headers: {"Content-Type": "application/json"});

    debugPrint("responseStatusCode: ${response.statusCode}");
    debugPrint("responseBody: ${response.body}");

    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);

      return responseData['recommendation'];
    }
    else{
      return "Something went wrong, please try again.";
    }
  }

  predictRainfall(Map rainfallData) async {
    final response = await http.post(Uri.parse("$uurl/predictRainfall"), body: jsonEncode(rainfallData), headers: {"Content-Type": "application/json"});

    debugPrint("responseStatusCode: ${response.statusCode}");
    debugPrint("responseBody: ${response.body}");

    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);

      return responseData.toString();
    }
    else{
      return "Something went wrong, please try again.";
    }
  }

}