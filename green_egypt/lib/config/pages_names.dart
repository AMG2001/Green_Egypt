import 'package:get/get.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen.dart';
import 'package:green_egypt/screens/login_screen/login_screen.dart';
import 'package:green_egypt/screens/splach_screen/splach_screen.dart';

class PagesNames {
  static String introductionScreen = "/intro";
  static String splachScreen = "/splach";
  static String loginScreen = "/login";

  static List<GetPage> listOfPages = [
    GetPage(
        name: PagesNames.splachScreen,
        page: () => SplachScreenCustom(),
        transition: Transition.fade),
    GetPage(
        name: PagesNames.introductionScreen,
        page: () => IntroductionScreen(),
        transition: Transition.fade),
    GetPage(
        name: PagesNames.loginScreen,
        page: () => LoginScreen(),
        transition: Transition.fade)
  ];
}
