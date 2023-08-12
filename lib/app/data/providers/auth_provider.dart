import 'package:aquayar/app/data/interfaces/auth_provider.dart';
import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/data/models/google_auth_user.dart';
import 'package:aquayar/network/api_endpoint.dart';
import 'package:aquayar/network/dio_client.dart';
import 'package:aquayar/network/dio_exception.dart';
import 'package:aquayar/network/typedef.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DioAuthProvider implements AuthProvider {
  @override
  EitherAuthUser signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(RoutesAndPaths.authSignUp,
          data: {"email": email, "password": password, "type": "customer"});

      return right(AuthUser.fromJson(
          {...response, "email": email, "displayName": "", "photoUrl": ""}));
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherAuthUser logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(RoutesAndPaths.authSignIn,
          data: {"email": email, "password": password, "type": "customer"});

      return right(AuthUser.fromJson(
          {...response, "email": email, "displayName": "", "photoUrl": ""}));
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
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
  EitherAuthUser signUpWithGoogle() async {
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

        return right(AuthUser.fromJson({
          ...response,
          "email": userDetails.email,
          "displayName": userDetails.displayName,
          "photoUrl": userDetails.photoUrl
        }));
      } else {
        return left("No user");
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherAuthUser signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? user = await googleSignIn.signIn();

      if (user != null) {
        final userDetails = GoogleAuthUser.fromGoogle(user);
        final response = await DioClient.instance
            .post(RoutesAndPaths.googleAuthSignIn, data: {
          "profileId": userDetails.id,
        });

        return right(AuthUser.fromJson({
          ...response,
          "email": userDetails.email,
          "displayName": userDetails.displayName,
          "photoUrl": userDetails.photoUrl
        }));
      } else {
        return left("Cannot log in with google at this time.");
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherMap forgotPassord({required String email}) async {
    try {
      final response =
          await DioClient.instance.post(RoutesAndPaths.forgotPassword, data: {
        "email": email,
      });

      return right(response);
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherMap checkOTP({
    required String otp,
  }) async {
    try {
      final response = await DioClient.instance.post(
        RoutesAndPaths.verifyOtpToChangePassword,
        data: {
          "otp": otp,
        },
      );

      return right(response);
    } on DioException {
      return left("The code has either expired or is invalid");
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherMap changePassword(
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
      return right(response);
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
