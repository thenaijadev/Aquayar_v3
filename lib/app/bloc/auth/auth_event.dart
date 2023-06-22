import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventSendEmailVerification extends AuthEvent {
  const AuthEventSendEmailVerification();
}

class AuthEventLogIn extends AuthEvent {
  final String email;
  final String password;
  const AuthEventLogIn({required this.email, required this.password});
}

class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;
  const AuthEventRegister({required this.email, required this.password});
}

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

class AuthEventForgotPassword extends AuthEvent {
  final String? email;
  const AuthEventForgotPassword({this.email});
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}

class AuthEventSignUpWithGoogle extends AuthEvent {
  const AuthEventSignUpWithGoogle();
}

class AuthEventSignInWithGoogle extends AuthEvent {
  const AuthEventSignInWithGoogle();
}

class AuthEventUpdateGenderAndName extends AuthEvent {
  final String name;
  final String gender;
  final String token;
  const AuthEventUpdateGenderAndName(
      {required this.name, required this.gender, required this.token});
}

class AuthEventUpdateCustomerLocation extends AuthEvent {
  final String name;
  final String city;
  final String address;
  final double? tankSize;
  final String token;

  const AuthEventUpdateCustomerLocation(
      {required this.name,
      required this.city,
      required this.address,
      this.tankSize,
      required this.token});
}

class AuthEventRequestResetEmail extends AuthEvent {
  final String email;
  const AuthEventRequestResetEmail({required this.email});
}
