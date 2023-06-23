import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/transaction_page_title_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/dimensions.dart';
import '../../../../config/theme/application_theme_controller_box.dart';
import '../../../../services/boxes/user_data_db.dart';
import 'Transaction_model_Month.dart';
import 'Transaction_model_Year.dart';
import 'Transaction_model_week.dart';


class Transaction_header extends StatefulWidget {
  @override
  State<Transaction_header> createState() => _Transaction_headerState();
}

class _Transaction_headerState extends State<Transaction_header> {
  late final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsPageTitleRow(),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /************************ Three Button ************************/
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 59, 60, 61)),
                minimumSize: MaterialStateProperty.all(
                    Size(Dimensions.width * 0.3, Dimensions.height * 0.05)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text('Weak',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              onPressed: () {
                setState(() {
                  pageController.jumpToPage(0);
                });
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 59, 60, 61)),
                minimumSize: MaterialStateProperty.all(
                    Size(Dimensions.width * 0.3, Dimensions.height * 0.05)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text('Month',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              onPressed: () {
                setState(() {
                  pageController.jumpToPage(1);
                });
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 59, 60, 61)),
                minimumSize: MaterialStateProperty.all(
                    Size(Dimensions.width * 0.3, Dimensions.height * 0.05)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text('Year',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              onPressed: () {
                setState(() {
                  pageController.jumpToPage(2);
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),

        Text(
          'Total : ${UserDataBox.instance.get_totalPoints()} point'.tr,
          style: TextStyle(
              color: ApplicationThemeController.instance.isDark
                  ? Colors.white
                  : Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 12,
        ),
        /************************ PageView For Three Model ************************/
        Container(
          height: Dimensions.height * 0.27,
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: [
              Center(
                child: Transaction_model_week(),
              ),
              Center(
                child: Transaction_model_month(),
              ),
              Center(
                child: Transaction_model_Year(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        /************************ PageIndicator ************************/
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Color(0xFF79c3f0),
              dotColor: Color(0xFF2d5da9),
              dotHeight: 15,
              dotWidth: 15,
              spacing: 12,
            ),
          ),
        ),
      ],
    );
  }
}
