// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String? id;
  final String? email;
  final bool? isVerified;
  final String? userType;
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
      this.userType = "customer"});

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
        userType: "customer",
        authToken: user["data"]["token"]);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'isVerified': isVerified,
      'userType': userType,
      'phone': phone,
      'authToken': authToken,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'gender': gender,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    final data = map['data'];
    return AuthUser(
      id: data != null ? data['id'] as String : null,
      email: data != null ? data['email'] as String : null,
      isVerified: map['isVerified'] as bool?,
      userType: data['type'] as String?,
      phone: data['phoneNo'] as String?,
      authToken: map['authToken'] as String?,
      displayName: data != null ? data['displayName'] as String? : null,
      photoUrl: map['photoUrl'] as String?,
      gender: data['gender'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AuthUser(id: $id, email: $email, isVerified: $isVerified, userType: $userType, phone: $phone, authToken: $authToken, displayName: $displayName, photoUrl: $photoUrl, gender: $gender)';
  }
}
