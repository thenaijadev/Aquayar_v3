import 'package:aquayar/app/data/exceptions/auth_exceptions.dart';
import 'package:aquayar/app/data/interfaces/auth_provider.dart';
import 'package:aquayar/app/data/models/google_auth_user.dart';
import 'package:aquayar/app/data/utilities/api_endpoint.dart';
import 'package:aquayar/app/data/utilities/dio_client.dart';
import 'package:aquayar/utilities/logger.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DioAuthProvider implements AuthProvider {
  @override
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(RoutesAndPaths.authSignUp,
          data: {"email": email, "password": password, "type": "customer"});

      return {...response, "email": email, "displayName": "", "photoUrl": ""};
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<Map<String, dynamic>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(RoutesAndPaths.authSignIn,
          data: {"email": email, "password": password, "type": "customer"});

      return {...response, "email": email, "displayName": "", "photoUrl": ""};
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
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
  Future<Map<String, dynamic>> signUpWithGoogle() async {
    final googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? user = await googleSignIn.signIn();

      if (user != null) {
        final userDetails = GoogleAuthUser.fromGoogle(user);
        final response = await DioClient.instance
            .post(RoutesAndPaths.googleAuthSignUp, data: {
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
  Future<Map<String, dynamic>> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? user = await googleSignIn.signIn();
      // ignore: avoid_print
      print(user);
      if (user != null) {
        final userDetails = GoogleAuthUser.fromGoogle(user);
        final response = await DioClient.instance
            .post(RoutesAndPaths.googleAuthSignIn, data: {
          "profileId": userDetails.id,
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
  Future<Map<String, dynamic>> forgotPassord({required String email}) async {
    try {
      final response =
          await DioClient.instance.post(RoutesAndPaths.forgotPassword, data: {
        "email": email,
      });
      logger.e(response);

      return response;
    } on DioException catch (error) {
      logger.e(error.response?.data);

      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<Map<String, dynamic>> checkOTP({
    required String otp,
  }) async {
    try {
      final response = await DioClient.instance.post(
        RoutesAndPaths.verifyOtpToChangePassword,
        data: {
          "otp": otp,
        },
      );

      return response;
    } on DioException catch (e) {
      logger.e(e.response?.data);
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<Map<String, dynamic>> changePassword(
      {required String password,
      required String confirmPassword,
      required String token}) async {
    try {
      final response = await DioClient.instance.patch(
        RoutesAndPaths.user,
        data: {"password": password, "passwordConfirmation": confirmPassword},
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
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
