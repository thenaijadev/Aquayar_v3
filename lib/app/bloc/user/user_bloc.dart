// ignore_for_file: unused_local_variable

import 'package:aquayar/app/bloc/user/user_state.dart';
import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/data/repos/user_repo.dart';
import 'package:aquayar/app/data/utilities/dio_exception.dart';
import 'package:aquayar/utilities/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserRepo userRepo) : super(UserInitial()) {
    on<UserEventUpdateCustomerLocation>(
      (event, emit) async {
        emit(UserStateIsLoading());
        String name = event.name;
        String address = event.address;
        String city = event.city;
        String token = event.token;
        double? tankSize = event.tankSize;

        try {
          final response = await userRepo.addLocation(
              name: name,
              token: token,
              address: address,
              city: city,
              tankSize: tankSize);
          emit(UserStateLocationUpdated());
        } on DioException catch (error) {
          logger.e(error.response?.data);
          final message = DioExceptionClass.fromDioError(error);

          emit(UserStateError(message: message.errorMessage));
        }
      },
    );

    on<UserEventGetOtp>(
      (event, emit) async {
        emit(UserStateIsLoading());
        String phone = event.phone;

        String token = event.token;

        try {
          final response = await userRepo.requestOtp(
            phone: phone,
            token: token,
          );
          emit(UserStateOtpRequestSent());
        } on DioException catch (error) {
          logger.e(error.response?.data);
          final message = DioExceptionClass.fromDioError(error);

          emit(UserStateError(message: message.errorMessage));
        }
      },
    );

    on<UserEventCheckOtp>(
      (event, emit) async {
        emit(UserStateIsLoading());
        int otp = event.otp;

        String token = event.token;

        try {
          final response = await userRepo.checkOTP(
            otp: otp,
            token: token,
          );
          emit(UserStateOtpChecked());
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);
          print(error.response?.data);

          emit(UserStateError(message: message.errorMessage));
        }
      },
    );

    on<UserEventGetUser>(
      (event, emit) async {
        emit(UserStateIsLoading());

        String? token = event.token;

        if (token == null) {
          emit(const UserStateError(message: "User not logged in"));
        }

        try {
          final response = await userRepo.getUser(
            token: token!,
          );
          emit(UserStateUserRetrieved(user: AuthUser.fromMap(response)));
        } on DioException catch (error) {
          final message = DioExceptionClass.fromDioError(error);
          print(error.response?.data);

          emit(UserStateError(message: message.errorMessage));
        }
      },
    );
  }
}
