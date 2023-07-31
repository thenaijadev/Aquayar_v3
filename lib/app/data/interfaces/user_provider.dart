import 'package:geolocator/geolocator.dart';

abstract class UserProviderInterface {
  // Future<void> initialize();
  // AuthUser? get currentUser;

  Future<Map<String, dynamic>> updateUser(
      {required String name, required String gender, required String token});

  Future<Position> getUserLocation();
  Future<Map<String, dynamic>> requestOtp({
    required String phone,
    required String token,
  });
  Future<Map<String, dynamic>> addLocation(
      {required String address,
      required String city,
      required String name,
      double? tankSize,
      required String token});
  Future<Map<String, dynamic>> checkOTP(
      {required int otp, required String token});

  Future<Map<String, dynamic>> getUser({required String token});
  Future<Map<String, dynamic>> getAllOrders({required String token});
}
