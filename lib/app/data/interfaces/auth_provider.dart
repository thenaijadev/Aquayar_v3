abstract class AuthProvider {
  // Future<void> initialize();
  // AuthUser? get currentUser;
  Future<Map<String, dynamic>> logIn({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
  });
  Future<void> logOut();
  // Future<Map<String, dynamic>> sendEmailVerification();
  Future<Map<String, dynamic>> forgotPassord({required String email});
  Future<Map<String, dynamic>> signUpWithGoogle();
  Future<Map<String, dynamic>> signInWithGoogle();
  Future<Map<String, dynamic>> checkOTP({
    required String otp,
  });
}
