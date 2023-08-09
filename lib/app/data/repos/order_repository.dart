// ignore_for_file: unused_local_variable

import 'package:aquayar/app/data/interfaces/order_provider.dart';
import 'package:aquayar/app/data/models/driver.dart';
import 'package:aquayar/app/data/providers/order_provider.dart';

class OrderRepo {
  final OrderProviderInterface provider;
  OrderRepo(this.provider);

  factory OrderRepo.fromDio() => OrderRepo(OrderProvider());

  Future<Driver> getNearestDriver(
      {required double waterSize,
      required double longitude,
      required double latitude,
      required String token}) async {
    final response = await provider.getNearestDriver(
        waterSize: waterSize,
        longitude: longitude,
        latitude: latitude,
        token: token);

    return response;
  }

  Future<Map<String, dynamic>> getPrice(
      {required double waterSize,
      required String token,
      required String startLocation,
      required String endLocation}) async {
    final response = await provider.getPrice(
        waterSize: waterSize,
        token: token,
        startLocation: startLocation,
        endLocation: endLocation);

    return response;
  }

  Future<Map<String, dynamic>> createOrder({
    required String token,
    required double waterSize,
    required String startLocation,
    required String endLocation,
    required double price,
    required String driver,
  }) async {
    final response = await provider.createOrder(
        waterSize: waterSize,
        token: token,
        startLocation: startLocation,
        endLocation: endLocation,
        price: price,
        driver: driver);

    return response;
  }
}
