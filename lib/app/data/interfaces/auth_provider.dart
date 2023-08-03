abstract class AuthProvider {
  Future<Map<String, dynamic>> logIn({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
  });
  Future<void> logOut();

  Future<Map<String, dynamic>> forgotPassord({required String email});
  Future<Map<String, dynamic>> changePassword(
      {required String password,
      required String confirmPassword,
      required String token});

  Future<Map<String, dynamic>> signUpWithGoogle();
  Future<Map<String, dynamic>> signInWithGoogle();
  Future<Map<String, dynamic>> checkOTP({
    required String otp,
  });
}
