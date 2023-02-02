import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:green_egypt/config/theme/default_colors.dart';

class HomePageActions extends StatelessWidget {
  const HomePageActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {},
        child: Center(
          child: badges.Badge(
            child: Icon(
              Icons.notifications,
              color: DefaultColors.defaultBlack,
              size: 28,
            ),
            position: badges.BadgePosition.custom(top: 0),
            badgeStyle:
                badges.BadgeStyle(badgeColor: DefaultColors.defaultGreen),
          ),
        ),
      ),
    );
  }
}
