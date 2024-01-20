import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static SharedPreferences? prefs;

  static Future<void> init() async{
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setIsConnected(bool isConnected) async{
    prefs!.setBool("isConnected", isConnected);
  }

  static Future<bool> getIsConnected() async{
    return prefs!.getBool('isConnected') ?? false;
  }
}