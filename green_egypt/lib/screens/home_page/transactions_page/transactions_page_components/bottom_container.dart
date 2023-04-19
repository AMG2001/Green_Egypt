import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/transaction_info_model.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width,
      height: 0.4 * Dimensions.height,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions'.tr,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All'.tr,
                    style: TextStyle(
                        color: Color(0XFFD9D9D9), fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                TransactionInfoModel(
                    date: 'June 12 2022'.tr,
                    garbage: '2 Plastic , 3 Kan'.tr,
                    price: '16.99'),
                TransactionInfoModel(
                    date: 'July 18 2022'.tr,
                    garbage: '2 Plastic , 3 Kan'.tr,
                    price: '16.99'),
                TransactionInfoModel(
                    date: 'June 12 2022'.tr,
                    garbage: '2 Plastic , 3 Kan'.tr,
                    price: '16.99'),
                TransactionInfoModel(
                    date: 'June 12 2022'.tr,
                    garbage: '2 Plastic , 3 Kan'.tr,
                    price: '16.99'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
