import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';

class SharedPreferencesClass {
  static final applicationThemeController =
      Get.put(ApplicationThemeController(), permanent: true);
  static Future<void> initAllSharedPreferences() async {
    await FirstLaunch.init();
    await UserDataModel.initiateUserDataModelSharedPref();
    await applicationThemeController.init();
  }
}
