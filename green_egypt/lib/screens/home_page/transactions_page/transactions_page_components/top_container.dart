import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/month_bar_model.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/transactions_page_header.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.white])),
                width: Dimensions.width,
                child: Column(
                  children: [
                    TransactionsPageHeader(),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MonthBarModel(
                          month: 'Jan'.tr,
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: 'Feb'.tr,
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: 'Mar'.tr,
                          barHeight: Dimensions.height * .1,
                        ),
                        MonthBarModel(
                          month: 'Apr'.tr,
                          barHeight: Dimensions.height * .09,
                        ),
                        MonthBarModel(
                          month: 'May'.tr,
                          barHeight: Dimensions.height * .08,
                        ),
                        MonthBarModel(
                          month: 'Jun'.tr,
                          barHeight: Dimensions.height * .1,
                        ),
                        MonthBarModel(
                          month: 'Jul'.tr,
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: 'Aug'.tr,
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: 'Sep'.tr,
                          barHeight: Dimensions.height * .15,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}