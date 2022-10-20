import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';

class SharedPreferencesClass {
  static Future<void> initAllSharedPreferences() async {
    await FirstLaunch.init();
    await UserDataModel.initiateUserDataModelSharedPref();
  }
}
