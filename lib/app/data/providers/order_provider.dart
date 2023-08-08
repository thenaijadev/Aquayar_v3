import 'package:aquayar/app/data/exceptions/auth_exceptions.dart';
import 'package:aquayar/app/data/interfaces/order_provider.dart';
import 'package:aquayar/app/data/utilities/api_endpoint.dart';
import 'package:aquayar/app/data/utilities/dio_client.dart';
import 'package:dio/dio.dart';

class OrderProvider extends OrderProviderInterface {
  @override
  Future<Map<String, dynamic>> getNearestDriver({
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
      print(response);
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      print(e);
      throw GenericAuthException();
    }
  }

  @override
  Future<Map<String, dynamic>> getPrice(
      {required String token,
      required double waterSize,
      required double distance}) async {
    try {
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
      print(response);
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      print(e);
      throw GenericAuthException();
    }
  }
}
