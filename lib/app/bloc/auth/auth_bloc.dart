// ignore_for_file: unused_local_variable

import 'package:aquayar/app/bloc/auth/auth_event.dart';
import 'package:aquayar/app/bloc/auth/auth_state.dart';
import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/data/repos/auth_repo.dart';
import 'package:aquayar/app/data/repos/user_repo.dart';
import 'package:aquayar/network/dio_exception.dart';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc(AuthRepo authRepo, UserRepo userRepo) : super(AuthStateInitial()) {
    final tokenBox = Hive.box("user_token_box");
    on<AuthEventRegister>((event, emit) async {
      emit(AuthStateIsLoading());
      final String email = event.email;
      final String password = event.password;

      final user = await authRepo.signUp(email: email, password: password);

      user.fold((l) {
        emit(AuthStateError(message: l));
      }, (r) {
        emit(AuthStateRegistered(user: r));
      });
    });

    on<AuthEventSignUpWithGoogle>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        final user = await authRepo.signUpWithGoogle();

        user.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) {
          emit(AuthStateRegistered(user: r));
        });
      },
    );

    on<AuthEventSignInWithGoogle>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        final user = await authRepo.signInWithGoogle();

        user.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) async {
          emit(AuthStateLoggedIn(user: r));
          await tokenBox.put("token", r.authToken);
        });
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

        final user = await authRepo.logIn(email: email, password: password);

        user.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) async {
          emit(AuthStateLoggedIn(user: r));
          await tokenBox.put("token", r.authToken);
        });
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

        final response = await authRepo.checkOTP(otp: otp);

        response.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) async {
          emit(AuthStatePasswordChangeOtpSent(
              resetToken: r["data"]["resetToken"]));
        });
      },
    );

    on<AuthEventChangePassword>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        String password = event.password;
        String confirmPassword = event.confirmPassword;
        String token = event.token;
        final response = await authRepo.changePassword(
            password: password, confirmPassword: confirmPassword, token: token);

        response.fold((l) {
          emit(AuthStateError(message: l));
        }, (r) {
          emit(AuthStatePasswordChanged());
        });
      },
    );
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthStateLoggedIn(user: AquayarAuthUser.fromMap(json));
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthStateLoggedIn) {
      return state.user.toMap();
    }
    return null;
  }
}
