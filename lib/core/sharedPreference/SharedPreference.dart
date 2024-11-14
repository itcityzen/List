import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceShow {
  static late SharedPreferences prefs;
  static String KeyUsername = 'Username';
  static String KeyLogin = 'Login';
  static String KeyUserID = 'UserID';

  static Future StartPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setUsername(String name) async {
    await prefs.setString(KeyUsername, name);
    print('Set Username in shared preference');
  }

  static Future<String?> getUsername() async {
    print('get user name in shared preference');
    return prefs.getString(KeyUsername);
  }

  static Future removeData() async {
    return prefs.clear();
  }

  static Future setLogin(bool Login) async {
    print('Login is set');
    await prefs.setBool(KeyLogin, Login);
  }

  static Future<bool?> getLogin() async {
    print('Login is get');

    return prefs.getBool(KeyLogin);
  }

  static Future<void> setUserId(int usernameId) async {
    print('UserID is set');

    await prefs.setInt(KeyUserID, usernameId);
  }

  static Future<int?> getUserId() async {
    print('UserID is get');

    return prefs.getInt(KeyUserID);
  }
}
