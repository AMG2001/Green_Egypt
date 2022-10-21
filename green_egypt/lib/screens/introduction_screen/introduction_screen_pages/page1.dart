import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page1 extends StatelessWidget {
  double width = Dimensions.width;
  double height = Dimensions.height;
  int pageIndex = 1;
  String heroTag = "tag";
  Color pageColor = Color(0xFF9EB235);
  late AssetImage image;
  late PageController controller;
  Page1({required this.image, required this.controller});

  @override
  Widget build(BuildContext context) {
    /**
     * Outer container that conisder main block
     */
    return Container(
      width: Dimensions.width,
      height: Dimensions.height,
      child: Column(
        children: [
          /**
           * container that hold image and cirlce background
           */
          Container(
            width: Dimensions.width,
            height: Dimensions.height * .6,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: pageColor.withOpacity(.4),
                    radius: Dimensions.width * .4,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: heroTag,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.height * .03,
                        ),
                        Image(
                          image: this.image,
                          width: Dimensions.width * .55,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          /**
           * Container that contain text , page indicator and button
           */
          Container(
            child: Column(
              children: [
                Text(
                  "ORGANIC",
                  style: TextStyle(
                      color: pageColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "WASTE",
                  style: TextStyle(
                      color: pageColor.withOpacity(.7),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Dimensions.height * .02,
                ),
                /**
                 * page Caption
                 */
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height * .05,
                ),
                /**
                 * Page Indicator
                 */
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: SlideEffect(
                      spacing: 18.0,
                      radius: 4.0,
                      dotWidth: 24.0,
                      dotHeight: 16.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: pageColor),
                )
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height * .05,
          ),
          /**
           * Next Button
           */
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  backgroundColor: MaterialStateProperty.all<Color>(pageColor)),
              onPressed: () {
                controller.nextPage(
                    duration: Duration(milliseconds: 750),
                    curve: Curves.easeInOut);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text("Next"), Icon(Icons.navigate_next_outlined)],
              ))
        ],
      ),
    );
  }
}
