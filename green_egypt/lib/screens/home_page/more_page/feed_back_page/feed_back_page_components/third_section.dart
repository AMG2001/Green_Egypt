import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.height * .03,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "What's driving your review?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "(optional)",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height * .02,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white70,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sentiment_satisfied_alt,
                      size: 27.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Text(
                  'plastic',
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white70,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sentiment_satisfied_alt,
                      size: 27.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Text(
                  'cans',
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white70,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sentiment_satisfied_alt,
                      size: 27.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Text(
                  'plastic bags',
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white70,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sentiment_satisfied_alt,
                      size: 27.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Text(
                  'other',
                ),
              ],
            ),
          ],
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
