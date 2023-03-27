import 'package:flutter/material.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl = UserDataBox.instance.get_userImageUrl();
    String userName = UserDataBox.instance.get_userName();
    return Row(
      children: [
        Container(
          height: 36,
          width: 48,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl)),
              borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Hello , ${userName}",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        ),
      ],
    );
  }
}
