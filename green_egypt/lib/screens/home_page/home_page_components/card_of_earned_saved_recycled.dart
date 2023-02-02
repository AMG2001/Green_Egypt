import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';

class CardOfEarnedSavedRecycled extends StatelessWidget {
  String earned;
  String saved;
  String recycled;
  CardOfEarnedSavedRecycled(
      {required this.earned, required this.saved, required this.recycled});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Dimensions.width,
          height: Dimensions.height * .2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: DefaultColors.defaultGreen),
          child: Row(
            children: [
              /**
                             * Earned Currency Column
                             */
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.currency_exchange_outlined,
                      color: Colors.yellow[300],
                      size: 28,
                    ),
                    Text(
                      earned,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.yellow[50]!.withOpacity(.9),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "EARNED",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
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
              /**
                             * Saved Co2 Column
                             */
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.cloud,
                      color: Colors.grey[350],
                      size: 28,
                    ),
                    Text(
                      saved + "g",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.yellow[50]!.withOpacity(.9),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "SAVED CO2",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.recycling_outlined,
                      color: Colors.green[800],
                      size: 28,
                    ),
                    Text(
                      recycled,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.yellow[50]!.withOpacity(.9),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "RECYCLED",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
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
