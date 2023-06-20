import 'package:flutter/foundation.dart';

@immutable
class UpdatedUser {
  final String? id;
  final String? userType;

  const UpdatedUser({required this.id, required this.userType});

  factory UpdatedUser.fromJson(
    user,
  ) {
    return UpdatedUser(
      id: user["data"]["id"],
      userType: user["data"]["type"],
    );
  }
}
