import 'package:faithful_servant/features/forgotten_password/data/forgotten_password_repo/forgotten_password_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgottenPasswordRepoImplement implements ForgottenPasswordRepo {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<void> changePasswordInFirebase({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('the email is not format');
    }
  }
}
