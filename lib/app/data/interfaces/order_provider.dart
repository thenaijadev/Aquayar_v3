import 'package:aquayar/app/data/models/driver.dart';

abstract class OrderProviderInterface {
  Future<Driver> getNearestDriver(
      {required double waterSize,
      required double longitude,
      required double latitude,
      required String token});

  Future<Map<String, dynamic>> getPrice({
    required String token,
    required double waterSize,
    required String startLocation,
    required String endLocation,
  });

  Future<Map<String, dynamic>> createOrder({
    required String token,
    required double waterSize,
    required String startLocation,
    required String endLocation,
    required double price,
    required String driver,
  });
}
