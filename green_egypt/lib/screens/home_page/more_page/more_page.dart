import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/application_theme_controller.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/application_theme_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/green_egypt_machines_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/green_egypt_support_divider.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/help_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/language_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/logout_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/more_page_header.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/send_feedback_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/settings_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/transaction_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/user_support_divider.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("more page"),
      ),
      body: GetBuilder<ApplicationThemeController>(
          init: ApplicationThemeController(),
          builder: (applicationThemeController) {
            return SafeArea(
              child: Container(
                width: Dimensions.width,
                height: Dimensions.height,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: Dimensions.height * .02,
                    ),
                    /**
                   * ************************************ More page Header *******************************
                   */
                    MorePageHeader(),
                    SizedBox(
                      height: Dimensions.height * .03,
                    ),
                    /**
                   * ************************************** Green Egypt Support ****************************
                   */
                    GreenEgyptSupportDivider(
                        applicationThemeController: applicationThemeController),

                    /**
                       * ************************************* Transactions History option **********************************
                       */
                    TransactionsOption(),
                    /**
                       * *************************************** Green Egypt Machines Locations option *************************
                       */
                    GreenEgyptMachinesOption(),
                    /**
                   * **************************** Help Option ***************************
                   */
                    HelpOption(),
                    /**
                   * ************************** User Support divider *****************************
                   */
                    UserSupportDivider(
                        applicationThemeController: applicationThemeController),
                    /**
                   * ****************************** Language Option ******************************
                   */
                    LanguageOption(),
                    /**
                   * **************************** Application theme Option *****************************
                   */
                    ApplicationThemeOption(
                        applicationThemeController: applicationThemeController,
                        darkThemeBool: applicationThemeController.isDark),
                    /**
                       * ****************************** Send Feedback Option *************************
                       */
                    SendFeedbackOption(),
                    /**
                   * ********************************** Logout option *************************
                   */
                    LogoutOption(
                        applicationThemeController: applicationThemeController)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
