import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';

class FaceBookAuthCustom {
  static Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      print(FacebookAuth.instance.getUserData().then((value) async {
        await UserDataModel.initiateUserDataModel(
          // TODO try to solve User number problem via Facebook
          userPhoneNumber: "",
            email: value['email'],
            name: value['name'],
            imageUrl: value['picture']['data']['url']);
      }).then((value) => Get.offNamed(PagesNames.homePage)));
      // you are logged
      final AccessToken accessToken = result.accessToken!;
    } else {
      print(result.status);
      print(result.message);
    }
  }
}
