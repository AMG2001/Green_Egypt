import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/screens/more_page/more_page_components/green_egypt_machines_option.dart';
import 'package:green_egypt/screens/more_page/more_page_components/more_page_header.dart';
import 'package:green_egypt/screens/more_page/more_page_components/settings_option.dart';
import 'package:green_egypt/screens/more_page/more_page_components/transaction_option.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Dimensions.width,
        height: Dimensions.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: Dimensions.height * .05,
              ),
              MorePageHeader(),
              SizedBox(
                height: Dimensions.height * .03,
              ),
              Container(
                height: 1.5,
                width: Dimensions.width * .75,
                color: Colors.grey[300],
              ),
              SizedBox(
                height: Dimensions.height * .03,
              ),
              /**
                   * Transactions History option
                   */
              TransactionsOption(),
              /**
                   * Green Egypt Machines Locations option
                   */
              GreenEgyptMachinesOption(),
              /**
             * Settings option
             */
              SettingsOption(),
              SizedBox(
                height: Dimensions.height * .03,
              ),
              Container(
                height: 1.5,
                width: Dimensions.width * .75,
                color: Colors.grey[300],
              ),
              SizedBox(
                height: Dimensions.height * .03,
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(PagesNames.feedBackPage);
                },
                leading: Icon(
                  Icons.feedback,
                  color: Colors.purple[300],
                ),
                title: Text(" Send feedback"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 18.sp,
                ),
              ),
              ListTile(
                onTap: () {
                  CustomToast.showBlackToast(
                      messsage: "This Function not added yet !");
                },
                leading: Icon(
                  Icons.help,
                  color: Colors.blue[300],
                ),
                title: Text(" Help"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 18.sp,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                onTap: () async {
                  Get.toNamed(PagesNames.loginScreen);
                  await UserDataModel.userLoggedOut();
                  await FirebaseAuth.instance.signOut();
                },
                leading: Icon(
                  Icons.login_sharp,
                  color: Colors.black,
                ),
                title: Text(" Logout"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 18.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
