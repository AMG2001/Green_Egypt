import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/transactions_page/controller/transaction_page_header_controller.dart';

class BarsGraph extends StatelessWidget {
  const BarsGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsPageUpperContainerController>(
        builder: (controller) {
      return Expanded(
        child: PageView.builder(
          onPageChanged: (value) {
            if (value == 0)
              controller.show7DaysView();
            else if (value == 1)
              controller.show4WeeksView();
            else if (value == 2) controller.show12MonthView();
          },
          controller: controller.pageController,
          itemCount: controller.barsView.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: controller.barsView[index],
            );
          },
        ),
      );
    });
  }
}
