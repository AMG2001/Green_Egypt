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

  /**
   * userDataModelSharedPref Object : 
   */
  static late SharedPreferences userDataModelSharedPref;

  /**
   * method tgat called before runnig application .
   */
  static Future<void> initiateUserDataModelSharedPref() async {
    /**
     * Get instance of sharedPreferences class 
     */
    userDataModelSharedPref = await SharedPreferences.getInstance();
    /**
     * if userDataModelSharedPref contain userName stored in ,
     *  it mean that user logged in before and user name is stored .
     * so return this value , else , return "" .
     */
    userName = userDataModelSharedPref.getString(_userNameKey) ?? "";
    /**
     * if userDataModelSharedPref contain userName stored in ,
     *  it mean that user logged in before and user name is stored .
     * so return this value , else , return "" .
     */
    userEmail = userDataModelSharedPref.getString(_userEmailKey) ?? "";
    /**
     * if userDataModelSharedPref contain userEmail stored in ,
     *  it mean that user logged in before and user email is stored .
     *  so return this value , else , return "" .
     */
    userImageURL = userDataModelSharedPref.getString(_userImageURLKey) ?? "";
    /**
     * if userDataModelSharedPref contain userImageUrl stored in ,
     *  it mean that user logged in before and user image url is stored .
     *  so return this value , else , return "" .
     */
    userLoggedIn = userDataModelSharedPref.getBool(_userLoggedInKey) ?? false;
    /**
     * if userDataModelSharedPref contain userLoggedInBool value stored in ,
     *  it mean that user logged in before and user logged in boolean value is stored .
     *  so return this value , else , return "" .
     */
    print('user logged bool initialized and it\'s value is $userLoggedIn');
  }

  /**
   * while Signing in , this ,ethod is called to store all user data .
   * it take as arguments : 
   * 1- userName
   * 2- userEmail
   * 3- UserImageUrl
   * and add them into userDataModelSharedPref Object
   */
  static Future<void> initiateUserDataModel(
      {required String name,
      required String email,
      required String imageUrl}) async {
    /**
         * initialize userName in userDataModelSharedPref
         */
    await userDataModelSharedPref
        .setString(_userNameKey, name)
        .then((value) => userName = name);
    /**
         * initialize userEmail in userDataModelSharedPref
         */
    await userDataModelSharedPref
        .setString(_userEmailKey, email)
        .then((value) => userEmail = email);
    /**
         * initialize userImageUrl in userDataModelSharedPref
         */
    await userDataModelSharedPref
        .setString(_userImageURLKey, imageUrl)
        .then((value) => userImageURL = imageUrl);
    /**
         * initialize userLoggedInBool in userDataModelSharedPref
         */
    await userDataModelSharedPref
        .setBool(_userLoggedInKey, true)
        .then((value) => userLoggedIn = true);
  }

  /**
   * method is called when user logged out to reset all userDataModel values .
   */
  static Future<void> userLoggedOut() async {
    // reset userName in userDataModel Object to ""
    await userDataModelSharedPref
        .setString(_userNameKey, "")
        .then((value) => userName = "");
    // reset userEmail in userDataModel Object to ""
    await userDataModelSharedPref
        .setString(_userEmailKey, "")
        .then((value) => userEmail = "");
    // reset userImageUrl in userDataModel Object to ""
    await userDataModelSharedPref
        .setString(_userImageURLKey, "")
        .then((value) => userImageURL = "");
    // reset userLoggedInBool in userDataModel Object to false
    await userDataModelSharedPref
        .setBool(_userLoggedInKey, false)
        .then((value) => userLoggedIn = false);
  }

  // return user name - String
  static String getUserName() {
    return userName;
  }

  // reurn user email - String
  static String getUserEmail() {
    return userEmail;
  }

  // return user image url - String
  static String getImageUrl() {
    return userImageURL;
  }

  // return userLoggedInBool - boolean
  static bool getUserLoggedInBool() {
    return userLoggedIn;
  }
}
