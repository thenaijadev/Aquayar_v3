import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String id;
  final String email;
  final bool isVerified;
  final Enum userType;
  final String phone;
  final String authToken;
  const AuthUser(
      {required this.authToken,
      required this.id,
      required this.phone,
      required this.email,
      required this.isVerified,
      this.userType = UserType.custumer});

  factory AuthUser.fromJson(user, email) => AuthUser(
      id: user["data"]["user"]["id"],
      email: email,
      isVerified: false,
      phone: "",
      userType: UserType.custumer,
      authToken: user["data"]["token"]);
}

enum UserType { custumer, driver }
