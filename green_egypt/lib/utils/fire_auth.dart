import 'package:firebase_auth/firebase_auth.dart';

class fireAuth {
  static Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
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
  }
}
