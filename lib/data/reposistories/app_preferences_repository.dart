import 'package:shared_preferences/shared_preferences.dart';

class AppPreferencesRepository {
  static const _appBarColorKey = 'app_bar_color';

  Future<String?> getAppBarColorCode() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_appBarColorKey);
  }

  Future<void> saveAppBarColorCode(String colorCode) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_appBarColorKey, colorCode);
  }
}
