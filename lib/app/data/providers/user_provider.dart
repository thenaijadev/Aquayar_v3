import 'package:aquayar/app/data/exceptions/auth_exceptions.dart';
import 'package:aquayar/app/data/interfaces/user_provider.dart';
import 'package:aquayar/app/data/utilities/api_endpoint.dart';
import 'package:aquayar/app/data/utilities/dio_client.dart';
import 'package:aquayar/utilities/logger.dart';
import 'package:dio/dio.dart';

class UserProvider implements UserProviderInterface {
  @override
  Future<Map<String, dynamic>> addLoaction(
      {required String address,
      required String city,
      required String name,
      String? tankSize}) {
    // TODO: implement addLoaction
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> updateUser(
      {required String name,
      required String gender,
      required String token}) async {
    logger.e(token);
    try {
      final response = await DioClient.instance.patch(
        RoutesAndPaths.user,
        data: {"email": name, "password": gender},
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
}
