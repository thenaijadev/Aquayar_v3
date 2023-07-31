// ignore_for_file: unused_local_variable

import 'package:aquayar/app/data/models/updated_user.dart';
import 'package:aquayar/app/data/providers/user_provider.dart';

class UserRepo {
  final UserProvider provider;
  UserRepo(this.provider);

  factory UserRepo.fromDio() => UserRepo(UserProvider());

  Future<UpdatedUser> updateUser(
      {required String name,
      required String gender,
      required String token}) async {
    final response = await provider.updateUser(
      gender: gender,
      token: token,
      name: name,
    );

    return UpdatedUser.fromJson(
      response,
    );
  }

  Future<void> addLocation({
    required String address,
    required String city,
    required String name,
    double? tankSize,
    required String token,
  }) async {
    final response = await provider.addLocation(
        address: address,
        city: city,
        name: name,
        token: token,
        tankSize: tankSize);
  }

  Future<void> requestOtp(
      {required String phone, required String token}) async {
    final response = await provider.requestOtp(phone: phone, token: token);
  }

  Future<void> checkOTP({required int otp, required String token}) {
    return provider.checkOTP(otp: otp, token: token);
  }

  Future<Map<String, dynamic>> getUser({required String token}) {
    return provider.getUser(token: token);
  }

  Future<Map<String, dynamic>> getAllOrders({required String token}) {
    return provider.getAllOrders(token: token);
  }
}
