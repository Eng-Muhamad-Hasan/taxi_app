import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taxi_app/core/constants/api_keys.dart';
import 'package:taxi_app/core/errors/exceptions.dart';

abstract class AuthService {}

class FirebaseAuthService extends AuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomExceptions.firebaseSignUpException(e);
    } catch (e) {
      throw CustomExceptions("حدث خطأ ما، يرجى المحاولة وقت اخر");
    }
  }
// Future sendEmailVerification()async{
// final user = FirebaseAuth.instance.currentUser;

//     final actionCodeSettings = ActionCodeSettings(
//       url: "http://www.example.com/verify?email=460995mhmdhsn@gmail.com",
//       iOSBundleId: "com.example.ios",
//       androidPackageName: "com.example.android",
//     );

//     await user?.sendEmailVerification(actionCodeSettings);
// }
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomExceptions.firebaseSignInException(e);
    }
  }

  Future<User> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize(
      clientId: ApiKeys.kGoogleClientId,
    );
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
