import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationThemeController extends GetxController {
  late bool isDark;
  late SharedPreferences currentThemeSharedPref;

  late ThemeData currentTheme;

  Future<void> init() async {
    /**
     * create instance of currentThemeSharedPref
     */
    currentThemeSharedPref = await SharedPreferences.getInstance();
    /**
     * check if currentThemeSharedPref created before or not !!
     * if it isn't created before .. then make theme is light mode .
     */
    if (currentThemeSharedPref.getBool('isDark') == null) {
      /**
       * default app theme is light mode 
       * make isDark variable = false .
       */
      await currentThemeSharedPref.setBool("isDark", false);
      isDark = false;
      currentTheme = ApplicationTheme.applicationLightTheme;
      update();
    } else {
      /**
       * to get last theme value.
       */
      isDark = currentThemeSharedPref.getBool("isDark")!;
      if (isDark == true)
        currentTheme = ApplicationTheme.applicationDarkTheme;
      else
        currentTheme = ApplicationTheme.applicationLightTheme;
      update();
    }
  }

/**
 * change the theme of the application
 */
  Future<void> changeApplicationTheme(bool val) async {
    /**
     * change value of currentTheme that stored in SharedPref .
     */
    await currentThemeSharedPref.setBool("isDark", val).then((value) {
      isDark = val;
      if (val == true) {
        currentTheme = ApplicationTheme.applicationDarkTheme;
        update();
      } else {
        currentTheme = ApplicationTheme.applicationLightTheme;
        update();
      }
    });
  }

  void updateUI() {
    update();
  }
}
