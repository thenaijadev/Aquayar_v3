import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserStateLocationUpdated extends UserState {}

class UserStateIsLoading extends UserState {}

class UserStateError extends UserState {
  final String message;
  const UserStateError({
    required this.message,
  });
}

class UserStateRequestOtp extends UserState {}

class UserStateOtpRequestSent extends UserState {}

class UserStateOtpChecked extends UserState {}
