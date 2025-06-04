
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {

  //单例
  static final SpUtil _instance = SpUtil._internal();
  factory SpUtil() {
    return _instance;
  }
  SpUtil._internal();


  static const String keyXlogPyFilePath = "keyXlogPyFilePath";


  Future<void> saveString(String key, String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  Future<String> getString(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? "";
  }

  Future<void> saveInt(String key, int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key)?? 0;
  }
  Future<void> saveBool(String key, bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key)?? false;
  }







}



