// ignore_for_file: unused_local_variable

import 'package:aquayar/app/data/interfaces/order_provider.dart';
import 'package:aquayar/app/data/providers/order_provider.dart';

class OrderRepo {
  final OrderProviderInterface provider;
  OrderRepo(this.provider);

  factory OrderRepo.fromDio() => OrderRepo(OrderProvider());

  Future<Map<String, dynamic>> getNearestDriver(
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
}
