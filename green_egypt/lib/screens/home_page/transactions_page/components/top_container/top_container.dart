import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/top_container/bars_graph.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/top_container/transaction_page_title_row.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/top_container/views_options.dart';
import 'package:green_egypt/screens/home_page/transactions_page/controller/transaction_page_header_controller.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsPageUpperContainerController>(
        init: TransactionsPageUpperContainerController(),
        builder: (controller) {
          return Container(
            height: Dimensions.height * .3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: ApplicationThemeController.instance.isDark
                        ? [Color.fromARGB(120, 158, 158, 158), Colors.black]
                        : [Colors.black, Colors.white])),
            width: Dimensions.width,
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /**
                     * title row contain transactions word with history logo .
                     */
                    TransactionsPageTitleRow(),
                    SizedBox(
                      height: 12,
                    ),
                    /**
                     * Views Options contain 7days , 4weeks , 12 month Buttons row .
                     */
                    ViewsOptions(),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total : ${UserDataBox.instance.get_totalPoints()} point'
                              .tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                BarsGraph(),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          );
        });
  }
}
