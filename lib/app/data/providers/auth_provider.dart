import 'package:aquayar/app/data/exceptions/auth_exceptions.dart';
import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/data/interfaces/auth_provider.dart';
import 'package:aquayar/app/data/models/google_auth_user.dart';
import 'package:aquayar/app/data/utilities/api_endpoint.dart';
import 'package:aquayar/app/data/utilities/dio_client.dart';
import 'package:aquayar/utilities/logger.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DioAuthProvider implements AuthProvider {
  // @override
  // Future<void> initialize() async {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }

  @override
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(RoutesAndPaths.authSignUp,
          data: {"email": email, "password": password});

      return {...response, "email": email, "displayName": "", "photoUrl": ""};
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  AuthUser? get currentUser {
    return null;

    // final user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   return AuthUser.fromApi(user);
    // } else {
    //   return null;
    // }
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();

    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    //   final user = currentUser;
    //   if (user != null) {
    //     return user;
    //   } else {
    //     throw UserNotLoggedInAuthException();
    //   }
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     throw UserNotFoundAuthException();
    //   } else if (e.code == 'wrong-password') {
    //     throw WrongPasswordAuthException();
    //   } else {
    //     throw GenericAuthException();
    //   }
    // } catch (_) {
    //   throw GenericAuthException();
    // }
  }

  @override
  Future<void> logOut() async {
    // final user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   await FirebaseAuth.instance.signOut();
    // } else {
    //   throw UserNotLoggedInAuthException();
    // }
  }

  @override
  Future<void> sendEmailVerification() async {
    // final user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   await user.sendEmailVerification();
    // } else {
    //   throw UserNotLoggedInAuthException();
    // }
  }

  @override
  Future<void> sendPasswordReset({required String toEmail}) async {
    // try {
    //   await FirebaseAuth.instance.sendPasswordResetEmail(email: toEmail);
    // } on FirebaseAuthException catch (e) {
    //   switch (e.code) {
    //     case 'firebase_auth/invalid-email':
    //       throw InvalidEmailAuthException();
    //     case 'firebase_auth/user-not-found':
    //       throw UserNotFoundAuthException();
    //     default:
    //       throw GenericAuthException();
    //   }
    // } catch (_) {
    //   throw GenericAuthException();
    // }
  }

  @override
  Future<Map<String, dynamic>> signUpWithGoogle() async {
    final googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? user = await googleSignIn.signIn();
      logger.e(user);
      if (user != null) {
        final userDetails = GoogleAuthUser.fromGoogle(user);
        final response = await DioClient.instance
            .post(RoutesAndPaths.googleAuthSignUpSignIn, data: {
          "profileId": userDetails.id,
          "email": userDetails.email,
          "displayName": userDetails.displayName
        });

        return {
          ...response,
          "email": userDetails.email,
          "displayName": userDetails.displayName,
          "photoUrl": userDetails.photoUrl
        };
      } else {
        throw UserNotLoggedInAuthException();
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateUser(
      {required String name,
      required String gender,
      required String token}) async {
    logger.e(token);
    try {
      final response = await DioClient.instance.patch(
        RoutesAndPaths.user,
        data: {"email": name, "password": gender},
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      // options: Options(headers: {"token": token}));

      return {
        ...response,
      };
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }
}
