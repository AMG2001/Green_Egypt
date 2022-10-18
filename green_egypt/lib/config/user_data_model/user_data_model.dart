import 'package:shared_preferences/shared_preferences.dart';

class UserDataModel {
  /**
   * User Data model variables
   */
  static late String userName;
  static late String userImageURL;
  static late String userEmail;
  static late bool userLoggedIn;
  /**
   * user Shared prefs keys - private Access .
   */
  static String _userEmailKey = "userEmailKey";
  static String _userNameKey = "userNameKey";
  static String _userImageURLKey = "userImageURLKey";
  static String _userLoggedInKey = "userLoggedIn";

  static late SharedPreferences userDataModelSharedPref;

  static Future<void> initiateUserDataModelSharedPref() async {
    userDataModelSharedPref = await SharedPreferences.getInstance();
    userName = userDataModelSharedPref.getString(_userNameKey) ?? "";
    userEmail = userDataModelSharedPref.getString(_userEmailKey) ?? "";
    userImageURL = userDataModelSharedPref.getString(_userImageURLKey) ?? "";
    userLoggedIn = userDataModelSharedPref.getBool(_userLoggedInKey) ?? false;
  }

  static Future<void> initiateUserDataModel(
      {required String name,
      required String email,
      required String imageUrl}) async {
    await userDataModelSharedPref.setString(_userNameKey, name);
    await userDataModelSharedPref.setString(_userEmailKey, email);
    await userDataModelSharedPref.setString(_userImageURLKey, imageUrl);
    await userDataModelSharedPref.setBool(_userLoggedInKey, true);
  }

  static Future<void> userLoggedOut() async {
    await userDataModelSharedPref.setString(_userNameKey, "");
    await userDataModelSharedPref.setString(_userEmailKey, "");
    await userDataModelSharedPref.setString(_userImageURLKey, "");
    await userDataModelSharedPref.setBool(_userLoggedInKey, false);
  }

  static String getUserName() {
    return userDataModelSharedPref.getString(_userNameKey)!;
  }

  static String getUserEmail() {
    return userDataModelSharedPref.getString(_userEmailKey)!;
  }

  static String getImageUrl() {
    return userDataModelSharedPref.getString(_userImageURLKey)!;
  }

  static bool getUserLoggedInBool() {
    return userDataModelSharedPref.getBool(_userLoggedInKey)!;
  }
}
