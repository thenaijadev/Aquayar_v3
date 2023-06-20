import 'package:aquayar/app/bloc/auth/auth_event.dart';
import 'package:aquayar/app/bloc/auth/auth_state.dart';
import 'package:aquayar/app/data/repos/auth_repo.dart';
import 'package:aquayar/app/data/utilities/dio_exception.dart';
import 'package:aquayar/utilities/logger.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthRepo authRepo) : super(AuthStateInitial()) {
    on<AuthEventRegister>((event, emit) async {
      emit(AuthStateIsLoading());
      final String email = event.email;
      final String password = event.password;
      try {
        final user = await authRepo.signUp(email: email, password: password);
        emit(AuthStateRegistered(user: user));
      } on DioException catch (error) {
        final message = DioExceptionClass.fromDioError(error);

        emit(AuthStateRegistrationError(message: message.errorMessage));
      }
    });

    on<AuthEventSignInWithGoogle>(
      (event, emit) async {
        emit(AuthStateIsLoading());

        try {
          final user = await authRepo.signUpWithGoogle();
          emit(AuthStateRegistered(user: user));
        } on DioException catch (error) {
          logger.e(error.response?.data);
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateRegistrationError(message: message.errorMessage));
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
          final user = await authRepo.updateUser(
              name: name, gender: gender, token: token);
          emit(AuthStateUserNameAndGenderUpdated(user: user));
          print(user.id);
        } on DioException catch (error) {
          logger.e(error.response?.data);
          final message = DioExceptionClass.fromDioError(error);

          emit(AuthStateRegistrationError(message: message.errorMessage));
        }
      },
    );
  }
}
