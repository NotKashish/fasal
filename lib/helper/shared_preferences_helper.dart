import 'package:shared_preferences/shared_preferences.dart';

import '../constants/keys.dart';

Future<void> setValues(String uid, String name, String email, String phoneNo,
    String aadharNo) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(UID_KEY, uid);
  await _prefs.setString(NAME_KEY, name);
  await _prefs.setString(EMAIL_KEY, email);
  await _prefs.setString(PHONE_KEY, phoneNo);
  await _prefs.setString(AADHAR_KEY, aadharNo);
}
