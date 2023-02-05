import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:green_egypt/screens/home_page/home_page_components/friendly_tips_item.dart';

class EcoFriendlyFullTips extends StatelessWidget {
  const EcoFriendlyFullTips({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * Implement List view with 15 tip .
     */
    return Scaffold(
      backgroundColor: Color(0xfffefefc),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
          Container(
            width: Dimensions.width,
            height: Dimensions.height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              color: Color(0xfff7f5f5),
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8,
                    width: Dimensions.width * .2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[350]!.withOpacity(.9)),
                  ),
                ),
                /**
                * one -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/socket.png',
                  tipTitle: "Switch off your plug sockets",
                  tipSubtitle:
                      "Save energy - and money! - by turning off your plugs.",
                ),

                /**
                * two -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/oven.png',
                  tipTitle: "Use your microwave",
                  tipSubtitle:
                      "microwaves are a lot more energy-efficient than conventional ovens.",
                ),

                /**
                * three -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/plastic.png',
                  tipTitle: "Reduce your plastic consumption",
                  tipSubtitle:
                      "why not pick up loose fruit and vegetable, instead of pre-wrapped packs? And don't forget your canvas bag!.",
                ),

                /**
                * four -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/water-bottle.png',
                  tipTitle:
                      "Keep a reusable water bottle and coffee cup on you",
                  tipSubtitle:
                      "This will help you reduce your use of single-waste plastic.",
                ),

                /**
                * five -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/vehicles.png',
                  tipTitle: "Use public transport",
                  tipSubtitle:
                      "A car may be the easiest and fastest option, but by taking the bus or train, or choosing to cycle or walk, you will help to pollute less.",
                ),

                /**
                * six -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/socket.png',
                  tipTitle: "Switch off your plug sockets",
                  tipSubtitle:
                      "Save energy - and money! - by turning off your plugs.",
                ),
                /**
                * seven -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/oven.png',
                  tipTitle: "Use your microwave",
                  tipSubtitle:
                      "microwaves are a lot more energy-efficient than conventional ovens.",
                ),

                /**
                * eight -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/plastic.png',
                  tipTitle: "Reduce your plastic consumption",
                  tipSubtitle:
                      "why not pick up loose fruit and vegetable, instead of pre-wrapped packs? And don't forget your canvas bag!.",
                ),
                /**
                * nine -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/water-bottle.png',
                  tipTitle:
                      "Keep a reusable water bottle and coffee cup on you",
                  tipSubtitle:
                      "This will help you reduce your use of single-waste plastic.",
                ),
                /**
                * ten -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/vehicles.png',
                  tipTitle: "Use public transport",
                  tipSubtitle:
                      "A car may be the easiest and fastest option, but by taking the bus or train, or choosing to cycle or walk, you will help to pollute less.",
                ),
                /**
                * eleven -friendly tip
                */

                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/socket.png',
                  tipTitle: "Switch off your plug sockets",
                  tipSubtitle:
                      "Save energy - and money! - by turning off your plugs.",
                ),
                /**
                * twelve -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath: 'assets/images/friendly_tips_images/oven.png',
                  tipTitle: "Use your microwave",
                  tipSubtitle:
                      "microwaves are a lot more energy-efficient than conventional ovens.",
                ),

                /**
                * thirteen -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/plastic.png',
                  tipTitle: "Reduce your plastic consumption",
                  tipSubtitle:
                      "why not pick up loose fruit and vegetable, instead of pre-wrapped packs? And don't forget your canvas bag!.",
                ),
                /**
                * fourteenth -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/water-bottle.png',
                  tipTitle:
                      "Keep a reusable water bottle and coffee cup on you",
                  tipSubtitle:
                      "This will help you reduce your use of single-waste plastic.",
                ),
                /**
                * ten -friendly tip
                */
                FriendlyTipsItem(
                  tipImagePath:
                      'assets/images/friendly_tips_images/vehicles.png',
                  tipTitle: "Use public transport",
                  tipSubtitle:
                      "A car may be the easiest and fastest option, but by taking the bus or train, or choosing to cycle or walk, you will help to pollute less.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
