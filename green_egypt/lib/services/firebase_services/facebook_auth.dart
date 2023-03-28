// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:green_egypt/config/pages_names.dart';
// import 'package:green_egypt/services/boxes/user_data_db.dart';
// import 'package:green_egypt/services/firebase_services/firebase_services.dart';

// class FacebookCustomAuth {
//   /**
//    * Signing in with Facebook : 
//    */

//   static Future<void> signInWithFacebook() async {
//     final LoginResult result = await FacebookAuth.instance
//         .login(); // by default we request the email and the public profile
//     if (result.status == LoginStatus.success) {
//       FacebookAuth.instance.getUserData().then((value) async {
//         /**
//          * try to get user data from firestore , if there is an error :
//          * it mean that user is first time login with this account , so 
//          * get data , send it to firestore , add data also to UserDataModel . 
//          */
//         try {
//           final document =
//               await FirebaseCustomServices.getUserDataFromFireStore(
//                   value['email']);
//           /**
//          * if there is no errors , it mean that this user account is registered before on firestore,
//          * so get account data in map and then store it in UserDataModel .
//          * then navigate to HomePage
//          */
//           var userData = document.docs.map((e) => e.data()).first;
//           /**
//            * Store fetched data in UserDataModel .
//            */

//           await FirebaseCustomServices.store_userFethcedData_InUserDataModel(
//                   userId: userData['user_id'],
//                   userName: userData['user_name'],
//                   userEmail: userData['user_email'],
//                   userImageUrl: userData['user_image_url'],
//                   phoneNumber: userData['user_phone_number'],
//                   userCredintial: userData['user_credintial'])
//               .then((value) => Get.offAllNamed(PagesNames.homePage));
//         } catch (e) {
//           /**
//                * add user in firestore but without id
//                */
//           print(e);
//           await FirebaseFirestore.instance.collection('user_logs').add({
//             'user_email': value['email'],
//             'user_name': value['name'],
//             'user_credintial': 'normal_user',
//             'user_image_url': value['picture']['data']['url'],
//             'user_phone_number': ""
//           }).then((document) async {
//             String id = document.id;
//             /**
//                    * add user data into user data box
//                    */

//             UserDataBox.instance.put_allUserData(
//                 id: document.id,
//                 name: value['name'],
//                 email: value['email'],
//                 imageUrl: value['picture']['data']['url'],
//                 phoneNumber: "",
//                 credintial: "normal_user");

//             /**
//              * update user data on firestore by adding id .
//              */
//             await FirebaseFirestore.instance
//                 .collection('user_logs')
//                 .doc(document.id)
//                 .update({'user_id': document.id}).then(
//                     (value) => Get.offAllNamed(PagesNames.homePage));
//           });
//         }
//         // you are logged
//         final AccessToken accessToken = result.accessToken!;
//       });
//     } else {
//       print(result.status);
//       print(result.message);
//     }
//   }
// }
