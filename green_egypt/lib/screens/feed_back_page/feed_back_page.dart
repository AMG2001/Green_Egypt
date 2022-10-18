import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  var areaText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      ' R E S Y ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Colors.deepOrangeAccent,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      'How was Tin Shed Garden Cafe?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'we appreciate feedback about your experince',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black54,
                    )
                  ],
                ),
                width: double.infinity,
                alignment: Alignment.center,
              )),
              Expanded(
                child: Column(
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
                          const Text(
                            'How likely are you recommend Tin shed Garden Cafe to others?',
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
                            initialRating: 2,
                            minRating: 1,
                            allowHalfRating: true,
                            direction: Axis.horizontal,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.deepOrangeAccent,
                            ),
                            onRatingUpdate: (value) {},
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'Not Likely',
                                ),
                                Text(
                                  '----------------------------------------------------',
                                ),
                                Text(
                                  'Likely',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
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
                    ),
                    Expanded(
                      child: Column(
                        children: [
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
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Anything else?",
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
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "We'll share your feedback privately with tin Shed Garden",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        //AreaText
                        ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
