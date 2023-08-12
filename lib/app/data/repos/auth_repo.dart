import 'dart:async';

import 'package:aquayar/app/data/interfaces/auth_provider.dart';

import 'package:aquayar/app/data/providers/auth_provider.dart';

import 'package:aquayar/network/typedef.dart';

class AuthRepo {
  final AuthProvider provider;
  AuthRepo(this.provider);

  factory AuthRepo.fromDio() => AuthRepo(DioAuthProvider());

  EitherAuthUser signUp({
    required String email,
    required String password,
  }) async {
    final response = await provider.signUp(
      email: email,
      password: password,
    );

    return response;
    // AuthUser.fromApi(response);
  }

  // @override
  // AuthUser? get currentUser => provider.currentUser;

  EitherAuthUser logIn({
    required String email,
    required String password,
  }) async {
    final user = await provider.logIn(
      email: email,
      password: password,
    );

    return user;
    // AuthUser.fromApi(response);
  }

  Future<void> logOut() => provider.logOut();

  // Future<void> sendEmailVerification() => provider.sendEmailVerification();

  // @override
  // Future<void> initialize() => provider.initialize();

  EitherMap forgotPassword({required String email}) =>
      provider.forgotPassord(email: email);

  EitherAuthUser signUpWithGoogle() async {
    final response = await provider.signUpWithGoogle();

    return response;
  }

  EitherAuthUser signInWithGoogle() async {
    final response = await provider.signInWithGoogle();

    return response;
  }

  EitherMap checkOTP({
    required String otp,
  }) {
    return provider.checkOTP(
      otp: otp,
    );
  }

  EitherMap changePassword(
      {required String password,
      required String confirmPassword,
      required String token}) async {
    return provider.changePassword(
        password: password, confirmPassword: confirmPassword, token: token);
  }
}
