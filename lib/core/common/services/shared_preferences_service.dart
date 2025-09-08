import 'dart:convert';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> ensureInitialized() async {
    if (preferences == null) {
      await init();
    }
  }

  //Set string Method
  static Future<void> setString(String key, String value) async {
    await ensureInitialized();
    await preferences!.setString(key, value);
  }

  //Get string Method
  static Future<String> getString(String key) async {
    await ensureInitialized();
    return preferences!.getString(key) ?? "";
  }

  //Set int Method
  static Future<void> setInt(String key, int value) async {
    await ensureInitialized();
    await preferences!.setInt(key, value);
  }

  //Get int Method
  static Future<int> getInt(String key) async {
    await ensureInitialized();
    return preferences!.getInt(key) ?? 0;
  }

  //Set Bool Method
  static Future<void> setBool(String key, bool value) async {
    await ensureInitialized();
    await preferences!.setBool(key, value);
  }

  //Get Bool Method
  static Future<bool> getBool(String key) async {
    await ensureInitialized();
    return preferences!.getBool(key) ?? false;
  }

  //Set Double Method
  static Future<void> setDouble(String key, double value) async {
    await ensureInitialized();
    await preferences!.setDouble(key, value);
  }

  //Get Double Method
  static Future<double> getDouble(String key) async {
    await ensureInitialized();
    return preferences!.getDouble(key) ?? 0.0;
  }

  //Set List<String> Method
  static Future<void> setStringList(String key, List<String> value) async {
    await ensureInitialized();
    await preferences!.setStringList(key, value);
  }

  //Get List<String> Method
  static Future<List<String>> getStringList(String key) async {
    await ensureInitialized();
    return preferences!.getStringList(key) ?? [];
  }

  //Set List<Map<String, dynamic>> Method
  static Future<void> setListOfMap(String key, List<dynamic> value) async {
    await ensureInitialized();

    String decodedValue = jsonEncode(value);
    await preferences!.setString(key, decodedValue);
  }

  //Get List<Map<String, dynamic>> Method
  static Future<List<dynamic>> getListOfMap(String key) async {
    await ensureInitialized();
    String? value = preferences!.getString(key);

    if (value == null) return [];
    List<dynamic> decodedValue = jsonDecode(value);
    return decodedValue;
  }

  // Remove a specific key
  static Future<void> remove(String key) async {
    await ensureInitialized();
    await preferences!.remove(key);
  }

  //Clear all keys
  static Future<void> clear() async {
    await ensureInitialized();
    await preferences!.clear();
  }
}
