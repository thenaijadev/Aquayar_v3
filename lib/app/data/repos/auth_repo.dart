import 'package:aquayar/app/data/interfaces/auth_provider.dart';
import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/data/models/google_auth_user.dart';
import 'package:aquayar/app/data/providers/auth_provider.dart';

class AuthRepo implements AuthProvider {
  final AuthProvider provider;
  const AuthRepo(this.provider);

  factory AuthRepo.firebase() => AuthRepo(FirebaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  // @override
  // Future<void> initialize() => provider.initialize();

  @override
  Future<void> sendPasswordReset({required String toEmail}) =>
      provider.sendPasswordReset(toEmail: toEmail);

  @override
  Future<GoogleAuthUser> signUpWithGoogle() async {
    return provider.signUpWithGoogle();
  }
}
