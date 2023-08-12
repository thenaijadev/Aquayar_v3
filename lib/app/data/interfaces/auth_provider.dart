import 'package:aquayar/network/typedef.dart';

abstract class AuthProvider {
  EitherAuthUser logIn({
    required String email,
    required String password,
  });
  EitherAuthUser signUp({
    required String email,
    required String password,
  });
  Future<void> logOut();

  EitherMap forgotPassord({required String email});
  EitherMap changePassword(
      {required String password,
      required String confirmPassword,
      required String token});

  EitherAuthUser signUpWithGoogle();
  EitherAuthUser signInWithGoogle();
  EitherMap checkOTP({
    required String otp,
  });
}
