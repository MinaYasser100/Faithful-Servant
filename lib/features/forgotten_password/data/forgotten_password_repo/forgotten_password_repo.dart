abstract class ForgottenPasswordRepo {
  Future<void> changePasswordInFirebase({required String email});
}
