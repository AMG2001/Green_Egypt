import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/services/Shared_preferences/shared_preferences_class.dart';

void main() async {
  // this line because i made main method Async 👀
  WidgetsFlutterBinding.ensureInitialized();
  // to initiate all Application Shared Preferences in one line 🔥 .
  await SharedPreferencesClass.initAllSharedPreferences();
  // run Flutter 🤍
  runApp(GreenEgypt());
}

class GreenEgypt extends StatelessWidget {
  const GreenEgypt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /**
       * Hide debug banner
       */
      debugShowCheckedModeBanner: false,
      /**
       * all application Routes are stored in 1 variable for cleaner code : 
       */
      getPages: PagesNames.listOfPages,
      /**
       * Application will start from splach Screen , 
       * then intro if application opened for first time .
       * else application will open directly on login if user not logged .
       * if user logged , open on main page "will be implemented tomorrow" .
       */
      initialRoute: PagesNames.splachScreen,
    );
  }
}
