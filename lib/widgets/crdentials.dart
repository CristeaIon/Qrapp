import 'dart:convert';

import 'package:MyDiscount/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPref sPrefs = SharedPref();

class Credentials {
  
  static const String credentials = "appuser:frj936epae293e9c6epae29";
  static Codec<String, String> stringToBase64 = utf8.fuse(base64);
  static String encoded = stringToBase64.encode(credentials);
  
}

getBodyData() async {
  var prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('Tid')) {
    var savedCredential = await sPrefs.credential();
    var userData = json.decode(savedCredential);
    final minUserData = json.encode(
        {"ID": userData['ID'], "RegisterMode": userData['RegisterMode']});
    return minUserData;
  } else {
    var fullUserData = await sPrefs.credential();
    return fullUserData;
  }
}
