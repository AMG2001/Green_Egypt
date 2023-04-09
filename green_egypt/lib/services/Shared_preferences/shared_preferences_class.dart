import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';

class SharedPreferencesClass {
  static Future<void> initAllSharedPreferences() async {
    // initialize application theme box .
    // await ApplicationThemeController.instance
    //     .initApplicationThemeController_ThemeAndBox();

    // user Data Box that contain all user data stored in .
    // boxes are local storing objects as Shared Preferences put with extra speed .
    UserDataBox.instance.initiateUserBox();
    // initialize First launch Shared pref to decide Navigation Destination .
    await FirstLaunch.init();
  }
}
