import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:green_egypt/screens/feed_back_page/feed_back_page_components/page_header.dart';
import 'package:green_egypt/screens/feed_back_page/feed_back_page_components/second_section.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
              /**
               * Page Header
               */
              FeedbackHeader(),
              SecondSection(),
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
                      flex: 1,
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
