import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences sharedPreferences;

  static configurePrefs() async {
    LocalStorage.sharedPreferences = await SharedPreferences.getInstance();
  }
}
