import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunch {
  static late SharedPreferences firstLaunchBool;
  static const String firstLaunchTag = 'firstLaunchDone';
  static late bool firstLaunchDoneBool;
  static Future<void> init() async {
    firstLaunchBool = await SharedPreferences.getInstance();
    if (firstLaunchBool.getBool(firstLaunchTag) == null) {
      await firstLaunchBool
          .setBool(firstLaunchTag, false)
          .then((value) => firstLaunchDoneBool = value);
    }
  }

  static bool firstLaunchDone() {
    return firstLaunchDoneBool;
  }

  static Future<void> changeFirstLaunchValue() async {
    await firstLaunchBool
        .setBool(firstLaunchTag, true)
        .then((value) => firstLaunchDoneBool = value);
  }
}
