import 'package:get/get.dart';

class IntroductionScreenController extends GetxController {
  int index = 0;
  String nextButtonName = "next";
  void increaseIndex() {
    index != 4 ? index++ : 4;
    if (index == 4) {
      nextButtonName = "start";
      update();
    }
  }

  void decreaseIndex() {
    index != 0 ? index -= 1 : 0;
    nextButtonName = "next";
    update();
  }
}
