import 'package:aquayar/app/data/exceptions/auth_exceptions.dart';
import 'package:aquayar/app/data/interfaces/user_provider.dart';
import 'package:aquayar/app/data/utilities/api_endpoint.dart';
import 'package:aquayar/app/data/utilities/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class UserProvider implements UserProviderInterface {
  @override
  Future<Map<String, dynamic>> addLocation({
    required String address,
    required String city,
    required String name,
    double? tankSize,
    required String token,
  }) async {
    try {
      Position position = await getUserLocation();

      final response = await DioClient.instance.post(
        RoutesAndPaths.location,
        data: {
          "address": address,
          "city": city,
          "name": name,
          "tankSize": tankSize,
          "longitude": position.longitude,
          "latitude": position.latitude
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      return {
        ...response,
      };
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<Map<String, dynamic>> updateUser(
      {required String name,
      required String gender,
      required String token}) async {
    try {
      final response = await DioClient.instance.patch(
        RoutesAndPaths.user,
        data: {"displayName": name, "gender": gender},
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      // options: Options(headers: {"token": token}));

      return {
        ...response,
      };
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<Position> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  @override
  Future<Map<String, dynamic>> requestOtp(
      {required String phone, required String token}) async {
    try {
      final response = await DioClient.instance.post(
        RoutesAndPaths.getOtp,
        data: {
          "phoneNo": phone,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      return {
        ...response,
      };
    } on DioException {
      rethrow;
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<Map<String, dynamic>> checkOTP(
      {required int otp, required String token}) async {
    try {
      final response = await DioClient.instance.post(
        RoutesAndPaths.checkOtp,
        data: {
          "otp": otp.toString(),
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
  Future<Map<String, dynamic>> getUser({required String token}) async {
    try {
      final response = await DioClient.instance.get(
        RoutesAndPaths.user,
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
