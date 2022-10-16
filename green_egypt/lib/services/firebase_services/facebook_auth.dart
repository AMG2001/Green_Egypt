import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FaceBookAuthCustom {
  static Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      print(FacebookAuth.instance.getUserData().then((value) {
        print('email is : ${value['email']}');
        print('name is : ${value['name']}');
        print(value['picture']['data']['url']);
      }));
      // you are logged
      final AccessToken accessToken = result.accessToken!;
    } else {
      print(result.status);
      print(result.message);
    }
  }
}
