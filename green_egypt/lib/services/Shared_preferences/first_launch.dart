import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunch {
  static late SharedPreferences firstLaunchBool;
  static Future<void> init() async {
    firstLaunchBool = await SharedPreferences.getInstance();
   if(firstLaunchBool.getBool("firstLaunchDone") == null){
      await firstLaunchBool.setBool('firstLaunchDone', false);
   }
  }

  static bool firstLaunchDone() {
    return firstLaunchBool.getBool("firstLaunchDone")!;
  }

  static Future<void> changeFirstLaunchValue() async {
    await firstLaunchBool.setBool('firstLaunchDone', true);
  }
}
