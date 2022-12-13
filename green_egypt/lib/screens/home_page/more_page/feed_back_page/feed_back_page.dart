import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feed_back_page_components/page_header.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feed_back_page_components/second_section.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feed_back_page_components/third_section.dart';
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
        child: Container(
          width: Dimensions.width,
          height: Dimensions.height,
          child: ListView(
            children: [
              /**
               * Page Header
               */
              FeedbackHeader(),
              SecondSection(),
              ThirdSection(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
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
                          "We'll share your feedback privately with Green Egypt Staff",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Dimensions.width,
                    height: Dimensions.height * .2,
                    padding: EdgeInsets.all(16),
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: "Give us your feedback "),
                      minLines: 10,
                      maxLines: 10,
                    ), //AreaText
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
