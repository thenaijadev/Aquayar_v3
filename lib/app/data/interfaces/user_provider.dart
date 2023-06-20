import 'package:geolocator/geolocator.dart';

abstract class UserProviderInterface {
  // Future<void> initialize();
  // AuthUser? get currentUser;

  Future<Map<String, dynamic>> updateUser(
      {required String name, required String gender, required String token});

  Future<Position> getUserLocation();
  Future<Map<String, dynamic>> addLocation(
      {required String address,
      required String city,
      required String name,
      String? tankSize,
      required String token});
}
