import 'package:aquayar/app/data/models/auth_user.dart';

abstract class AuthProvider {
  // Future<void> initialize();
  // AuthUser? get currentUser;
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
  Future<Map<String, dynamic>> signUpWithGoogle();
}
