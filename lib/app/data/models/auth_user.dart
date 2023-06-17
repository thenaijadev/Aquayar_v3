import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String id;
  final String email;
  final bool isVerified;
  final Enum userType;
  final String phone;
  const AuthUser(
      {required this.id,
      required this.phone,
      required this.email,
      required this.isVerified,
      this.userType = UserType.custumer});

  factory AuthUser.fromApi(user) => AuthUser(
      id: user.id,
      email: user.email!,
      isVerified: user.emailVerified,
      phone: user.phone,
      userType: user.userType);
}

enum UserType { custumer, driver }
