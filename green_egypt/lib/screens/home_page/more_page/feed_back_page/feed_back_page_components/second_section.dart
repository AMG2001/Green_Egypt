import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:green_egypt/config/dimensions.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Dimensions.height * .025,
              ),
              const Text(
                'How likely are you recommend Green Egypt Application to others?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RatingBar.builder(
                itemCount: 5,
                initialRating: 1,
                minRating: 1,
                allowHalfRating: true,
                direction: Axis.horizontal,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                onRatingUpdate: (value) {},
              ),
              SizedBox(
                height: Dimensions.height * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: Dimensions.width * .12,
                  ),
                  Text(
                    'Not Suggest',
                  ),
                  SizedBox(
                    width: Dimensions.width * .38,
                  ),
                  Text(
                    'Sugget it ',
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height * .03,
        ),
        const Divider(
          height: 1,
          color: Colors.black54,
        ),
      ],
    );
  }
}
