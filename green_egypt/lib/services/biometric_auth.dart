import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class BiometricController extends GetxController {
  
  BiometricController._privateConstructor();

  static final BiometricController _instance =
      BiometricController._privateConstructor();

  static BiometricController get instance => _instance;

  late final bool isCanAuthenticate;

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> initBiometricAuth() async {
    try {
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

      isCanAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    } catch (e) {
      print('error while initializing Biometric Auth , error : $e');
    }
  }

  Future<void> authinticateWithFingerprint(
      {required String messageToUser}) async {
    await auth
        .authenticate(
      localizedReason: messageToUser,
    )
        .then((isAuthinticated) {
      if (isAuthinticated == true) {
        // TODO do in success
        print('user authonticated');
      } else {
        // TODO do in faliure
        print('user not authinticated');
      }
    });
  }
}
