import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants/keys.dart';

class WeatherApiServices
{

  geocoding({String state = "andhrapradesh", String district = "hyderabad"}) async {
    final response = await http.get(
        Uri.parse("${geocodingUrl+district}&limit=10&appid=$weatherApiKey")
    );

    debugPrint("responseStatusCode we: ${response.statusCode}");
    debugPrint("responseBody we: ${response.body}");

    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);

      print("latitude: ${responseData[0]['lat']}");
      return {
        "lat": responseData[0]['lat'],
        "lon": responseData[0]['lon']
      };
    }
    else{
      return "Something went wrong, please try again.";
    }
  }

  getTempAndHumidity({String lat = "20", String lon = "77"}) async {
    final response = await http.get(
        Uri.parse("${weatherApiUrl}lat=${lat}&lon=${lon}&appid=$weatherApiKey")
    );

    debugPrint("responseStatusCode th: ${response.statusCode}");
    debugPrint("responseBody th: ${response.body}");

    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);

      return {
        "humidity": responseData['main']['humidity'],
        "temp": responseData['main']['temp']
      };
    }
    else{
      return "Something went wrong, please try again.";
    }
  }

}