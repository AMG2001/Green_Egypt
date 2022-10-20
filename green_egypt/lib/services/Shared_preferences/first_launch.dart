import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunch {
  static late SharedPreferences firstLaunchBoolSharedPref;
  static const String firstLaunchTag = 'firstLaunchDone';
  static late bool firstLaunchDoneBool;

  static Future<void> init() async {
    firstLaunchBoolSharedPref = await SharedPreferences.getInstance();
    firstLaunchDoneBool =
        firstLaunchBoolSharedPref.getBool(firstLaunchTag) ?? false;
    firstLaunchBoolSharedPref.getBool(firstLaunchTag) == null
        ? await firstLaunchBoolSharedPref.setBool(firstLaunchTag, false)
        : null;
  }

  static bool getFirstLaunchDoneBool() {
    return firstLaunchDoneBool;
  }

  static Future<void> changeFirstLaunchValue() async {
    firstLaunchDoneBool = await firstLaunchBoolSharedPref.setBool(firstLaunchTag, true);
  }
}
