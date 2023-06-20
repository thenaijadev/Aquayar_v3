import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String? id;
  final String? email;
  final bool? isVerified;
  final Enum? userType;
  final String? phone;
  final String? authToken;
  final String? displayName;
  final String? photoUrl;
  final String? gender;

  const AuthUser(
      {required this.authToken,
      required this.photoUrl,
      required this.id,
      required this.phone,
      required this.displayName,
      required this.email,
      required this.isVerified,
      this.gender,
      this.userType = UserType.custumer});

  factory AuthUser.fromJson(
    user,
  ) {
    return AuthUser(
        id: user["data"]["user"]["id"],
        isVerified: false,
        email: user["email"],
        displayName: user["displayName"],
        phone: "",
        photoUrl: user["photoUrl"],
        userType: UserType.custumer,
        authToken: user["data"]["token"]);
  }
}

enum UserType { custumer, driver }
