import 'package:green_egypt/services/console_message.dart';
import 'package:hive/hive.dart';

class UserDataBox {
  /**
   * Accessable keys through level of Class .
   */
  String _key_userName = 'username';
  String _key_userImageUrl = 'userImageUrl';
  String _key_userEmail = 'userEmail';
  String _key_userPhoneNumber = 'phoneNumber';
  String _key_userLoggedIn = 'loggedIn';
  String _key_userCredintial = 'userCredintial';
  String _key_userId = 'userId';
  String _key_apply_review_before = "apply_review_before";
  String _key_userEarnedCash = "user_earned_cash";
  String _key_userSavedCo2 = "user_saved_co2";
  String _key_userRecycledItems = "user_recycled_items";

  /**
   * Singleton Class .
   */
  UserDataBox._privateConstructor();

  static final UserDataBox _instance = UserDataBox._privateConstructor();

  static UserDataBox get instance => _instance;

  // object that used in each and write operation in user  box .
  late Box _userDataBox;

  /***
   * *************************** initialize User Data Box *********************************
   */
  void initiateUserBox() async {
    _userDataBox = await Hive.openBox('userBox');
    ConsoleMessage.successMessage('User box opened');
  }

  /***
   * *************************** User Name Operations *********************************
   */
  void put_userName({required String userName}) async {
    await _userDataBox.put(_key_userName, userName);
  }

  String get_userName() {
    return _userDataBox.get(_key_userName, defaultValue: "");
  }

  /**
   * ************************** User image url operations *******************************
   */
  void put_userImageUrl({required String userImageUrl}) async {
    await _userDataBox.put(_key_userImageUrl, userImageUrl);
  }

  String get_userImageUrl() {
    return _userDataBox.get(_key_userImageUrl, defaultValue: "");
  }

  /**
   * ******************************* user email operations *********************************
   */
  void put_userEmail({required String email}) async {
    await _userDataBox.put(_key_userEmail, email);
  }

  String get_email() {
    return _userDataBox.get(_key_userEmail, defaultValue: "");
  }

  /**
   * **************************** user phone number operations **********************************
   */
  void put_userPhoneNumber({required String phoneNumber}) async {
    await _userDataBox.put(_key_userPhoneNumber, phoneNumber);
  }

  String get_phoneNumber() {
    return _userDataBox.get(_key_userPhoneNumber, defaultValue: "");
  }

  /**
   * ************************** logged in bool operations ***************************************
   */
  void put_loggedInBool({required bool loggedIn}) async {
    await _userDataBox.put(_key_userLoggedIn, loggedIn);
  }

  bool get_loggedInBool() {
    return _userDataBox.get(_key_userLoggedIn, defaultValue: false);
  }

  /**
   * ***************************** user credintial operations ********************************
   */
  void put_userCredintial({required String credintail}) async {
    await _userDataBox.put(_key_userCredintial, credintail);
  }

  String get_credintial() {
    return _userDataBox.get(_key_userCredintial, defaultValue: "");
  }

  /**
   *  **************************** user id operations ***********************************
   */
  void put_userId({required String id}) async {
    await _userDataBox.put(_key_userId, id);
  }

  String get_id() {
    return _userDataBox.get(_key_userId, defaultValue: "");
  }

  /**
   *  **************************** Apply review before Boolean operations ***********************************
   */
  void put_applyReviewBefore({required bool apply}) async {
    await _userDataBox.put(_key_apply_review_before, apply);
  }

  bool get_applyReviewBeforeBool() {
    return _userDataBox.get(_key_apply_review_before, defaultValue: false);
  }

  /**
   *  **************************** Apply review before Boolean operations ***********************************
   */
  void put_earnedCash({required int earned}) async {
    await _userDataBox.put(_key_userEarnedCash, earned);
  }

  int get_earnedCash() {
    return _userDataBox.get(_key_userEarnedCash, defaultValue: 0);
  }

  /**
   *  **************************** Apply review before Boolean operations ***********************************
   */
  void put_savedCo2({required int saved}) async {
    await _userDataBox.put(_key_userSavedCo2, saved);
  }

  int get_savedCo2() {
    return _userDataBox.get(_key_userSavedCo2, defaultValue: "");
  }

  /**
   *  **************************** Apply review before Boolean operations ***********************************
   */
  void put_recycledItems({required int recycled}) async {
    await _userDataBox.put(_key_userRecycledItems, recycled);
  }

  int get_recycledItems() {
    return _userDataBox.get(_key_userRecycledItems, defaultValue: 0);
  }

  void put_allUserData(
      {required String id,
      required String name,
      required String email,
      required String imageUrl,
      required String phoneNumber,
      required String credintial,
      required int earned,
      required int savedCo2,
      required int recycledItems,
      required bool reviewedBefore,
      required bool loggedIn}) {
    put_userId(id: id);
    put_userName(userName: name);
    put_userEmail(email: email);
    put_userImageUrl(userImageUrl: imageUrl);
    put_userPhoneNumber(phoneNumber: phoneNumber);
    put_userCredintial(credintail: credintial);
    put_earnedCash(earned: earned);
    put_savedCo2(saved: savedCo2);
    put_recycledItems(recycled: recycledItems);
    put_applyReviewBefore(apply: reviewedBefore);
    put_loggedInBool(loggedIn: loggedIn);
  }

  void userLoggedOut() {
   put_userId(id: "");
    put_userName(userName: "");
    put_userEmail(email: "");
    put_userImageUrl(userImageUrl: "");
    put_userPhoneNumber(phoneNumber: "");
    put_userCredintial(credintail: "");
    put_earnedCash(earned: 0);
    put_savedCo2(saved: 0);
    put_recycledItems(recycled: 0);
    put_applyReviewBefore(apply: false);
    put_loggedInBool(loggedIn: false);
  }
}
