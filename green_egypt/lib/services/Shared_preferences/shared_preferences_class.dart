import 'package:green_egypt/services/Shared_preferences/first_launch.dart';

class SharedPreferencesClass {
  static Future<void> initAllSharedPreferences() async {
    await FirstLaunch.init();
  }
}
