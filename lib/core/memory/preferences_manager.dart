import 'package:chat_app/core/memory/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static PreferencesManager? _instance;
  SharedPreferences? _preferences;
  static PreferencesManager get instance {
    _instance ??= PreferencesManager._init();
    return _instance!;
  }

  PreferencesManager._init();

  static preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<void> setStringVal(PreferencesKeys key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  String getStringVal(PreferencesKeys key) => _preferences?.getString(key.toString()) ?? "";

  Future<void> setIntVal(PreferencesKeys key, int value) async {
    await _preferences?.setInt(key.toString(), value);
  }

  int getIntVal(PreferencesKeys key) => _preferences?.getInt(key.toString()) ?? -1;

  Future<void> setBoolVal(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  bool getBoolVal(PreferencesKeys key) => _preferences?.getBool(key.toString()) ?? false;

  Future<void> setDoubleVal(PreferencesKeys key, double value) async {
    await _preferences!.setDouble(key.toString(), value);
  }

  double getDoubleVal(PreferencesKeys key) => _preferences?.getDouble(key.toString()) ?? -1.0;
}
