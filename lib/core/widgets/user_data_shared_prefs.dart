import 'package:shared_preferences/shared_preferences.dart';

class UserDataSharedPrefs {
  // static late SharedPreferences sharedPrefs;
  // static Future<void> init() async {
  //   sharedPrefs = await SharedPreferences.getInstance();
  // }

  static Future<void> saveUserData({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setStringList("user_data", [name, email, password, phone]);
  }

  static Future<List<String>> getUserData() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    List<String> userData = sharedPrefs.getStringList("user_data") ?? [];
    return userData;
  }
}
