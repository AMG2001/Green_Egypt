import 'package:flutter/material.dart';
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
                          month: "Jan",
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: "Feb",
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: "Mar",
                          barHeight: Dimensions.height * .1,
                        ),
                        MonthBarModel(
                          month: "Apr",
                          barHeight: Dimensions.height * .09,
                        ),
                        MonthBarModel(
                          month: "May",
                          barHeight: Dimensions.height * .08,
                        ),
                        MonthBarModel(
                          month: "Jun",
                          barHeight: Dimensions.height * .1,
                        ),
                        MonthBarModel(
                          month: "Jul",
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: "Aug",
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: "Sep",
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