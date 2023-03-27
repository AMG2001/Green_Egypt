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
    return _userDataBox.get(_key_userName,defaultValue:"");
  }

  /**
   * ************************** User image url operations *******************************
   */
  void put_userImageUrl({required String userImageUrl}) async {
    await _userDataBox.put(_key_userImageUrl, userImageUrl);
  }

  String get_userImageUrl() {
    return _userDataBox.get(_key_userImageUrl, defaultValue:"");
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
    return _userDataBox.get(_key_userPhoneNumber,defaultValue:  "");
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

  void put_allUserData(
      {required String id,
      required String name,
      required String email,
      required String imageUrl,
      required String phoneNumber,
      required String credintial}) {
    put_userId(id: id);
    put_userName(userName: name);
    put_userEmail(email: email);
    put_userImageUrl(userImageUrl: imageUrl);
    put_userPhoneNumber(phoneNumber: phoneNumber);
    put_userCredintial(credintail: credintial);
    put_loggedInBool(loggedIn: true);
  }
}
