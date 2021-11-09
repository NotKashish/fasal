import 'package:shared_preferences/shared_preferences.dart';
import '../constants/keys.dart';

Future<bool> setValues(String uid, String name, String email, String phoneNo,
    String aadharNo, String region) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(UID_KEY, uid);
  await _prefs.setString(NAME_KEY, name);
  await _prefs.setString(EMAIL_KEY, email);
  await _prefs.setString(PHONE_KEY, phoneNo);
  await _prefs.setString(AADHAR_KEY, aadharNo);
  await _prefs.setString(REGION_KEY, region);
  return true;
}

Future<String?> getUidFromPrefs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(UID_KEY);
}

Future<String?> getNameFromPrefs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(NAME_KEY);
}

Future<String?> getEmailFromPrefs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(EMAIL_KEY);
}

Future<String?> getPhoneFromPrefs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(PHONE_KEY);
}

Future<String?> getAadharFromPrefs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(AADHAR_KEY);
}

Future<String?> getRegionFromPrefs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return _prefs.getString(REGION_KEY);
}
