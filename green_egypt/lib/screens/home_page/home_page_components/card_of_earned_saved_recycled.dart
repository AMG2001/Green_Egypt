import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_animations_controller.dart';
import 'package:green_egypt/screens/home_page/home_page_components/user_detail_column.dart';

class CardOfEarnedSavedRecycled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Dimensions.width,
          height: Dimensions.height * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/main_page_images/card_background.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(24),
            color: DefaultColors.defaultGreen,
          ),
          child: Row(
            children: [
              /**
                             * Earned Currency Column
                             */
              UserDetailColumn(
                  icon: Icon(
                    Icons.currency_exchange_rounded,
                    color: Colors.yellow[400],
                  ),
                  detailValue: '1250',
                  detailTitle: 'EARNED'.tr,
                  animationMilliSeconds: 500),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: Dimensions.height * .1,
                    color: Colors.white.withOpacity(.9),
                  )
                ],
              ),
              UserDetailColumn(
                  icon: Icon(
                    Icons.cloud,
                    color: Colors.grey[350],
                    size: 28,
                  ),
                  detailValue: '350g',
                  detailTitle: 'SAVED CO2'.tr,
                  animationMilliSeconds: 500),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: Dimensions.height * .1,
                    color: Colors.white.withOpacity(.9),
                  )
                ],
              ),
              UserDetailColumn(
                  icon: Icon(
                    Icons.recycling_outlined,
                    color: Colors.green[800],
                    size: 28,
                  ),
                  detailValue: '17',
                  detailTitle: 'RECYCLED'.tr,
                  animationMilliSeconds: 500),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: Dimensions.height * .1,
                    color: Colors.green[900]!.withOpacity(.2),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
