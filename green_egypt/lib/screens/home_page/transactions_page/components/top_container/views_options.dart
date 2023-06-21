import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/transactions_page/controller/transaction_page_header_controller.dart';

class ViewsOptions extends StatelessWidget {
  const ViewsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsPageUpperContainerController>(
        builder: (controller) {
      return Container(
        height: Dimensions.height * .06,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: controller.barsViewindex == 0
                          ? Colors.white
                          : Colors.black),
                  onPressed: () {
                    controller.show7DaysView();
                  },
                  child: Text(
                    '7 Days'.tr,
                    style: TextStyle(
                        color: controller.barsViewindex == 0
                            ? Colors.black
                            : Colors.white),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: controller.barsViewindex == 1
                          ? Colors.white
                          : Colors.black),
                  onPressed: () {
                    controller.show4WeeksView();
                  },
                  child: Text(
                    '4 Weeks'.tr,
                    style: TextStyle(
                        color: controller.barsViewindex == 1
                            ? Colors.black
                            : Colors.white),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: controller.barsViewindex == 2
                        ? Colors.white
                        : Colors.black),
                onPressed: () {
                  controller.show12MonthView();
                },
                child: Text(
                  '12 Month'.tr,
                  style: TextStyle(
                      color: controller.barsViewindex == 2
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
