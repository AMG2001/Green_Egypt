import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/screens/home_page/salah_screen.dart';

class EcoFriendlyTipsRow extends StatelessWidget {
  const EcoFriendlyTipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Eco-friendly tips",
                  style: TextStyle(
                      fontFamily: DefaultFonts.defaultLondrinaSolidThin,
                      fontSize: 22),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                        color: DefaultColors.defaultGreen,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
