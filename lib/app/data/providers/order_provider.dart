import 'package:aquayar/app/data/exceptions/auth_exceptions.dart';
import 'package:aquayar/app/data/interfaces/order_provider.dart';
import 'package:aquayar/app/data/models/driver.dart';
import 'package:aquayar/app/data/utilities/api_endpoint.dart';
import 'package:aquayar/app/data/utilities/dio_client.dart';
import 'package:aquayar/app/services/location_service.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class OrderProvider extends OrderProviderInterface {
  @override
  Future<Driver> getNearestDriver({
    required double waterSize,
    required double longitude,
    required double latitude,
    required String token,
  }) async {
    try {
      final response = await DioClient.instance.post(
        RoutesAndPaths.orderInit,
        data: {
          "waterSize": waterSize,
          "longitude": longitude,
          "latitude": latitude
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final driverData = response["data"];

      final Driver driver = Driver.fromMap(driverData);

      return driver;
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<Map<String, dynamic>> getPrice(
      {required String token,
      required double waterSize,
      required String startLocation,
      required String endLocation}) async {
    try {
      var directions =
          await LocationService().getDirections(startLocation, endLocation);

      final distance = Geolocator.distanceBetween(
          directions?["start_location"]["lat"],
          directions?["start_location"]["lng"],
          directions?["end_location"]["lat"],
          directions?["end_location"]["lng"]);

      print(distance);

      final response = await DioClient.instance.post(
        RoutesAndPaths.getPrice,
        data: {
          "waterSize": waterSize,
          "distance": distance,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<Map<String, dynamic>> createOrder({
    required String token,
    required double waterSize,
    required String startLocation,
    required String endLocation,
    required double price,
    required String driver,
  }) async {
    try {
      var directions =
          await LocationService().getDirections(startLocation, endLocation);

      final distance = Geolocator.distanceBetween(
          directions?["start_location"]["lat"],
          directions?["start_location"]["lng"],
          directions?["end_location"]["lat"],
          directions?["end_location"]["lng"]);

      final response = await DioClient.instance.post(
        RoutesAndPaths.createOrder,
        data: {
          "waterSize": waterSize,
          "distance": distance,
          "price": price,
          "latitude": directions?["start_location"]["lat"],
          "longitude": directions?["start_location"]["lng"],
          "driver": driver
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }
}
