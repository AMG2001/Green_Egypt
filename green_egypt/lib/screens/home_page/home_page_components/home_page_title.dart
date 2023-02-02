import 'package:flutter/material.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 48,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(UserDataModel.userImageURL)),
              borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Hello , ${UserDataModel.userName}",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        ),
      ],
    );
  }
}
