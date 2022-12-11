import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.width,
        height: Dimensions.height,
        child: Image(
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/transaction_page_design.png'),
        ));
  }
}

/**
 * Stack(
          children: [
            Container(
              width: Dimensions.width,
              height: Dimensions.height,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width * .1,
                      ),
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage("assetName"),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Hi, Alexander 👋 "),
                          Text("Let's save your money")
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
 */