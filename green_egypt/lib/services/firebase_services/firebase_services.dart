import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:green_egypt/services/custom_toast.dart';
import '../boxes/user_data_db.dart';

class FirebaseCustomServices {
  /**
 * After login , add user fetched data from google auth to firestore .
 */
  static Future<DocumentReference<Map<String, dynamic>>>
      addUserFetchedData_InFireStore(
          {required String userEmail,
          required String userName,
          required String imageUrl,
          required String phoneNumber,
          required String userCredintial}) async {
    var x;
    try {
      await FirebaseFirestore.instance.collection('user_logs').add({
        'user_email': userEmail,
        'user_name': userName,
        'user_image_url': imageUrl,
        'user_phone_number': phoneNumber,
        'user_credintial': userCredintial
      }).then((value) {
        x = value;
      });
      ConsoleMessage.successMessage('uploading user data without id done');
    } catch (e) {
      ConsoleMessage.errorMessage(
          'error while uploading user data without id', e.toString());
    }
    return x;
  }

  /**
   * After adding user data into firestore , get generated id and add it with other user data .
   */
  static Future<void> addId_ToUserDataInFireStore(
      DocumentReference<Map<String, dynamic>> document) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_logs')
          .doc(document.id)
          .update({'user_id': document.id});

      ConsoleMessage.successMessage('adding id to user data done');
    } catch (e) {
      ConsoleMessage.errorMessage(
          'error while uploading user id with other data', e.toString());
    }
  }

/**
 * get user data from firestore to init it in UserDataModel shared preferences .
 */
  static Future<QuerySnapshot<Map<String, dynamic>>> getUserDataFromFireStore(
      String userEmail) async {
    late QuerySnapshot<Map<String, dynamic>> x;
    print('\n\n'
        'user email is : $userEmail'
        '\n\n');
    await FirebaseFirestore.instance
        .collection('user_logs')
        .where('user_email', isEqualTo: userEmail)
        .get()
        .then((value) {
      x = value;
      if (x.docs.isEmpty) {
        print('\n\n'
            'this user first time logged in'
            '\n\n');
      } else {
        ConsoleMessage.successMessage('getting user data from firestore done');
        print('\n\n'
            'user getted data from firestore is : ${x.docs}'
            '\n\n');
      }
    });
    return x;
  }

  /**
   * Store Fethced data from fire Store into User Data Model .
   */
  static Future<void> store_userFethcedData_InUserDataModel(
      {required String userId,
      required String phoneNumber,
      required String userCredintial,
      required String userEmail,
      required String userName,
      required String userImageUrl}) async {
    UserDataBox.instance.put_allUserData(
        id: userId,
        name: userName,
        email: userEmail,
        imageUrl: userImageUrl,
        phoneNumber: phoneNumber,
        credintial: userCredintial);
  }

  /**
   * Sign in with email and password : 
   */
  static Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print("no user found for this email");
        } else if (e.code == 'Wrong-password') {
          print('Wrong password provided');
        }
        return user;
      }
    } catch (e) {
      CustomToast.showRedToast(
          messsage:
              "error when sign in with email and password : \n ${e.toString()}");
    }
  }

  /**
           * Register user in firebase Auth
           */
  static Future<void> registerNewUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userNumber,
    required String userCredintial,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      String userName = "${firstName} ${lastName}";
      /**
                       * Store user data in fireStore , but without id : 
                       */
      await FirebaseFirestore.instance.collection('user_logs').add({
        'user_name': userName,
        'user_first_name': firstName,
        'user_last_name': lastName,
        'user_email': email,
        'user_image_url':
            "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg",
        'user_phone_number': userNumber,
        'user_credintial': userCredintial
      }).then((value) async {
        String id = value.id;

        UserDataBox.instance.put_allUserData(
            id: id,
            name: userName,
            email: email,
            imageUrl:
                "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg",
            phoneNumber: userNumber,
            credintial: userCredintial);
        /**
                     * update the same record by adding id to .
                     */
        await FirebaseFirestore.instance
            .collection('user_logs')
            .doc(id)
            .update({'user_id': id});
      });
    });
  }
}
