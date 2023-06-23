import 'dart:async';

import 'package:aquayar/app/data/interfaces/auth_provider.dart';
import 'package:aquayar/app/data/models/auth_user.dart';

import 'package:aquayar/app/data/providers/auth_provider.dart';

class AuthRepo {
  final AuthProvider provider;
  AuthRepo(this.provider);

  factory AuthRepo.fromDio() => AuthRepo(DioAuthProvider());

  Future<AuthUser> signUp({
    required String email,
    required String password,
  }) async {
    final response = await provider.signUp(
      email: email,
      password: password,
    );
    final AuthUser user = AuthUser.fromJson(
      response,
    );

    return user;
    // AuthUser.fromApi(response);
  }

  // @override
  // AuthUser? get currentUser => provider.currentUser;

  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    final response = await provider.logIn(
      email: email,
      password: password,
    );
    final AuthUser user = AuthUser.fromJson(
      response,
    );

    return user;
    // AuthUser.fromApi(response);
  }

  Future<void> logOut() => provider.logOut();

  // Future<void> sendEmailVerification() => provider.sendEmailVerification();

  // @override
  // Future<void> initialize() => provider.initialize();

  Future<void> forgotPassword({required String email}) =>
      provider.forgotPassord(email: email);

  Future<AuthUser> signUpWithGoogle() async {
    final response = await provider.signUpWithGoogle();

    return AuthUser.fromJson(
      response,
    );
  }

  Future<AuthUser> signInWithGoogle() async {
    final response = await provider.signInWithGoogle();

    return AuthUser.fromJson(
      response,
    );
  }

  Future<Map<String, dynamic>> checkOTP({
    required String otp,
  }) {
    return provider.checkOTP(
      otp: otp,
    );
  }

  Future<Map<String, dynamic>> changePassword(
      {required String password,
      required String confirmPassword,
      required String token}) async {
    return provider.changePassword(
        password: password, confirmPassword: confirmPassword, token: token);
  }
}
