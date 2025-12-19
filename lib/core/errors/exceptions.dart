import 'package:firebase_auth/firebase_auth.dart';

class CustomExceptions implements Exception {
  final String message;
  CustomExceptions(this.message);
  @override
  String toString() {
    return message;
  }


  factory CustomExceptions.firebaseSignUpException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return CustomExceptions(
          'كلمة المرور ضعيفة جداً, يرجى اختيار كلمة مرور أقوى',
        );
      case 'email-already-in-use':
        return CustomExceptions('لديك حساب مسبقاً، يرجى تسجيل الدخول');
      case 'invalid-email':
        return CustomExceptions('! البريد الإلكتروني غير صحيح');
      case 'network-request-failed':
        return CustomExceptions(
          'لا يوجد اتصال بالإنترنت، يرجى التحقق من الاتصال والمحاولة مرة أخرى',
        );
      default:
        return CustomExceptions("حدث خطأ ما، يرجى المحاولة وقت اخر");
    }
  }

factory CustomExceptions.firebaseSignInException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return CustomExceptions('لم يتم العثور على المستخدم');
      case 'wrong-password':
        return CustomExceptions('كلمة المرور غير صحيحة');
      default:
        return CustomExceptions("حدث خطأ ما، يرجى المحاولة وقت اخر");
    }
  }

}
