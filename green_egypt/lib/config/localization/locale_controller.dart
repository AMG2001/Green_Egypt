import 'dart:ui';

import 'package:get/get.dart';

class localController extends GetxController {
 // Locale initallang= sharepref!.getString("lang")=="ar"?Locale("ar"):Locale("en");
  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
 // sharepref!.setString("lang",codelang);
    
    Get.updateLocale(locale);
  }
}
