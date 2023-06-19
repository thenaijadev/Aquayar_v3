import 'package:aquayar/app/data/models/auth_user.dart';

import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthStateInitial extends AuthState {}

class AuthStateIsLoading extends AuthState {}

class AuthStateRegistrationError extends AuthState {
  final String message;
  AuthStateRegistrationError({
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
}
