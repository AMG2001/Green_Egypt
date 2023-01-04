
class FaceBookAuthCustom {

}



/**
 * in error Code : 
 * /**
               * add user in firestore but without id
               */
          await FirebaseFirestore.instance.collection('user_logs').add({
            'user_email': value['email'],
            'user_name': value['name'],
            'user_image_url': value['picture']['data']['url'],
            'user_phone_number': ""
          }).then((document) async {
            /**
             * update user data on firestore by adding id .
             */
            await FirebaseFirestore.instance
                .collection('user_logs')
                .doc(document.id)
                .update({'user_id': document.id}).then((x) async {
              /**
                   * add user data into UserDataModel
                   */
              await UserDataModel.initiateUserDataModel(
                  // TODO try to solve User number problem via Facebook
                  userPhoneNumber: "",
                  email: value['email'],
                  name: value['name'],
                  imageUrl: value['picture']['data']['url']);
            }).then((value) => Get.offNamed(PagesNames.homePage));
          });
 */