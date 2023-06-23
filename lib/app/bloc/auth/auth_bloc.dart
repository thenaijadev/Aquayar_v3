import 'package:aquayar/app/bloc/auth/auth_event.dart';
import 'package:aquayar/app/bloc/auth/auth_state.dart';
import 'package:aquayar/app/data/repos/auth_repo.dart';
import 'package:aquayar/app/data/repos/user_repo.dart';
import 'package:aquayar/app/data/utilities/dio_exception.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthRepo authRepo, UserRepo userRepo) : super(AuthStateInitial()) {
    on<AuthEventRegister>((event, emit) async {
      emit(AuthStateIsLoading());
      final String email = event.email;
      final String password = event.password;
      try {
        final user = await authRepo.signUp(email: email, password: password);
        emit(AuthStateRegistered(user: user));
      } on DioException {
        emit(AuthStateError(message: "Authentication failed."));
      }
    });

    on<AuthEventSignUpWithGoogle>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        try {
          final user = await authRepo.signUpWithGoogle();
          emit(AuthStateRegistered(user: user));
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateError(message: message.errorMessage));
        }
      },
    );

    on<AuthEventSignInWithGoogle>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        try {
          final user = await authRepo.signInWithGoogle();
          emit(AuthStateLoggedIn(user: user));
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateError(message: message.errorMessage));
        }
      },
    );

    on<AuthEventUpdateGenderAndName>(
      (event, emit) async {
        emit(AuthStateIsLoading());
        String name = event.name;
        String gender = event.gender;
        String token = event.token;

        try {
          final user = await userRepo.updateUser(
              name: name, gender: gender, token: token);
          emit(AuthStateUserNameAndGenderUpdated(user: user));
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateError(message: message.errorMessage));
        }
      },
    );

    on<AuthEventLogIn>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        final String email = event.email;
        final String password = event.password;
        try {
          final user = await authRepo.logIn(email: email, password: password);
          emit(AuthStateLoggedIn(user: user));
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateError(message: message.errorMessage));
        }
      },
    );

    on<AuthEventForgotPassword>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        final String email = event.email;

        try {
          final user = await authRepo.forgotPassword(
            email: email,
          );
          emit(AuthStatePasswordResetRequestSent());
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateError(message: message.errorMessage));
        }
      },
    );

    on<AuthEventCheckOtpForPasswordChange>(
      (event, emit) async {
        emit(AuthStateIsLoading());
        String otp = event.otp;

        try {
          final response = await authRepo.checkOTP(otp: otp);

          emit(AuthStatePasswordChangeOtpSent(
              resetToken: response["data"]["resetToken"]));
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateError(message: message.errorMessage));
        }
      },
    );

    on<AuthEventChangePassword>(
      (event, emit) async {
        emit(AuthStateIsLoading());
        try {
          String password = event.password;
          String confirmPassword = event.confirmPassword;
          String token = event.token;
          final response = await authRepo.changePassword(
              password: password,
              confirmPassword: confirmPassword,
              token: token);

          emit(AuthStatePasswordChanged());
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateError(message: message.errorMessage));
        }
      },
    );
  }
}
