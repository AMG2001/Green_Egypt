import 'package:shared_preferences/shared_preferences.dart';

class UserDataModel {
  /**
   * User Data model variables
   */
  // will hold user name "First + last name " .
  static late String userName;
  // user image URL .
  static late String userImageURL;
  // user email .
  static late String userEmail;
  // user phone number .
  static late String userNumber;
  // user state , logged in or not .
  static late bool userLoggedIn;
  // user credintial "one of staff of regular user ".
  static late String userCredintial;
  /**
   * user Shared prefs keys - private Access .
   */
  static String _userEmailKey = "userEmailKey";
  static String _userNameKey = "userNameKey";
  static String _userImageURLKey = "userImageURLKey";
  static String _userLoggedInKey = "userLoggedIn";
  static String _userNumberKey = "userNumberKey";
  static String _userCredintialKey = "userCredintial";

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
    userNumber = userDataModelSharedPref.getString(_userNumberKey) ?? "";
    /**
     * if userDataModelSharedPref contain userLoggedInBool value stored in ,
     *  it mean that user logged in before and user logged in boolean value is stored .
     *  so return this value , else , return "" .
     */
    userCredintial = userDataModelSharedPref.getString(_userCredintialKey) ?? "";
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

  // TODO : add user Credintail here .
  static Future<void> initiateUserDataModel(
      {required String name,
      required String email,
      required String imageUrl,
      required String userPhoneNumber,
      required String userCredintialArg
      }) async {
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
         * initialize userImageUrl in userDataModelSharedPref
         */
    await userDataModelSharedPref
        .setString(_userNumberKey, userPhoneNumber)
        .then((value) => userNumber = userPhoneNumber);
    /**
         * initialize userCredintials in userDataModelSharedPref
         */
        await userDataModelSharedPref
        .setString(_userCredintialKey, userCredintialArg)
        .then((value) => userCredintial = userCredintialArg);
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
    // reset userImageUrl in userDataModel Object to ""
    await userDataModelSharedPref
        .setString(_userNumberKey, "")
        .then((value) => userNumber = "");
         // reset userCredinital data  in userDataModel Object to ""
    await userDataModelSharedPref
        .setString(_userCredintialKey, "")
        .then((value) => userCredintial = "");
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

  static String getUserNumber() {
    return userNumber;
  }

// return userCredintial - String
  static String getUserCredintial() {
    return userCredintial;
  }
  // return userLoggedInBool - boolean
  static bool getUserLoggedInBool() {
    return userLoggedIn;
  }

  Map<String, dynamic> getUserDataFromJson() {
    Map<String, dynamic> userData = {};

    return userData;
  }
}
