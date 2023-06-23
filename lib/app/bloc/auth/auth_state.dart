import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/data/models/updated_user.dart';

import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {}

class AuthStateIsLoading extends AuthState {}

class AuthStateError extends AuthState {
  final String message;
  AuthStateError({
    required this.message,
  });
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  AuthStateLoggedIn({
    required this.user,
  });
}

class AuthStateRegistered extends AuthState {
  final AuthUser user;
  AuthStateRegistered({
    required this.user,
  });
  @override
  List<Object?> get props => [user];

  AuthUser get getUser => user;
}

class AuthStateLocationUpdated extends AuthState {}

class AuthStateUserNameAndGenderUpdated extends AuthState {
  final UpdatedUser user;
  AuthStateUserNameAndGenderUpdated({
    required this.user,
  });
}

class AuthStatePasswordResetRequestSent extends AuthState {}

class AuthStatePasswordChangeOtpSent extends AuthState {
  final String resetToken;
  AuthStatePasswordChangeOtpSent({required this.resetToken});
}

class AuthStatePasswordChanged extends AuthState {}
