import 'package:flutter/material.dart';
import 'package:green_egypt/screens/home_page/home_page_components/friendly_tips_item.dart';

class ListOfFriendlyTips extends StatelessWidget {
  ListOfFriendlyTips({super.key});
  List<Widget> miniEcoFriendlyTipsList = [
    /**
     * 1 - plug Socket
     */
    FriendlyTipsItem(
      tipImagePath: 'assets/images/friendly_tips_images/socket.png',
      tipTitle: "Switch off your plug sockets",
      tipSubtitle: "Save energy - and money! - by turning off your plugs.",
    ),
    /**
     * 2- use microwave .
     */
    FriendlyTipsItem(
      tipImagePath: 'assets/images/friendly_tips_images/oven.png',
      tipTitle: "Use your microwave",
      tipSubtitle:
          "microwaves are a lot more energy-efficient than conventional ovens.",
    ),
    /**
     * 3- reduce your plastic
     */
    FriendlyTipsItem(
      tipImagePath: 'assets/images/friendly_tips_images/plastic.png',
      tipTitle: "Reduce your plastic consumption",
      tipSubtitle:
          "why not pick up loose fruit and vegetable, instead of pre-wrapped packs? And don't forget your canvas bag!.",
    ),
    /**
     * 4- keep reusable water
     */
    FriendlyTipsItem(
      tipImagePath: 'assets/images/friendly_tips_images/water-bottle.png',
      tipTitle: "Keep a reusable water bottle and coffee cup on you",
      tipSubtitle:
          "This will help you reduce your use of single-waste plastic.",
    ),
    /**
     * 5- Use public transport
     */
    FriendlyTipsItem(
      tipImagePath: 'assets/images/friendly_tips_images/vehicles.png',
      tipTitle: "Use public transport",
      tipSubtitle:
          "A car may be the easiest and fastest option, but by taking the bus or train, or choosing to cycle or walk, you will help to pollute less.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        children: miniEcoFriendlyTipsList,
      ),
    );
  }
}
