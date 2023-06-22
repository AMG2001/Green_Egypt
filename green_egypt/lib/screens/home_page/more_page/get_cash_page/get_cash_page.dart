import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/controller/get_cash_page_controller.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class GetCashPage extends StatelessWidget {
  const GetCashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GetCashPageController>(
            init: GetCashPageController(),
            builder: (controller) {
              return Container(
                color: Colors.black.withOpacity(.5),
                child: Center(
                  child: Container(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 750),
                      opacity: controller.opacity,
                      curve: Curves.easeInOutCubic,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.5),
                                borderRadius: BorderRadius.circular(32)),
                            width: Dimensions.width * .3,
                            height: 8,
                          ),
                          Text(
                              "Thanks for Suppoting Recycling \n\n ${UserDataBox.instance.get_userName()}",
                              textAlign: TextAlign.center),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Now , Scan",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              FaIcon(
                                FontAwesomeIcons.qrcode,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "And Earn",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              FaIcon(
                                FontAwesomeIcons.moneyBill,
                              )
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 200,
                                child: SfBarcodeGenerator(
                                  value: '35 Points : 4.5 le',
                                  symbology: QRCode(),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "35 point : 12 le",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("I'm Done"))
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    width: Dimensions.width * .8,
                    height: Dimensions.height * .6,
                  ),
                ),
                width: Dimensions.width,
                height: Dimensions.height,
              );
            }),
      ),
    );
  }
}


/**
 * *************** Draw Ticket shape with code
 */

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = Dimensions.width;
//     double h = Dimensions.height;
//     final path = Path()
//       ..lineTo(w * .05, 0)
//       ..quadraticBezierTo(w * .1, h * .05, w * .2, 0)
//       ..close();

//     throw UnimplementedError();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
