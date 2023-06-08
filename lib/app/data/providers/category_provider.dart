// import 'package:aquayar/app/data/utilities/dio_client.dart';
// import 'package:dio/dio.dart';
// import 'package:ecommerce_application/app/data/utilities/api_endpoint.dart';
// import 'package:ecommerce_application/app/data/utilities/dio_client.dart';
// import 'package:ecommerce_application/app/data/utilities/dio_exception.dart';
// import 'package:ecommerce_application/utilities/logger.dart';

// class CategoriesProvider {
//   static Future<List<dynamic>> getAllCategories() async {
//     try {
//       final response = await DioClient.instance.get(categories);
//       logger.v(response);
//       return response;
//     } on DioError catch (e) {
//       var error = DioException.fromDioError(e);
//       throw error.errorMessage;
//     }
//   }

//   static Future<List<dynamic>> getProductsByCategory(String theCategory) async {
//     try {
//       final response = await DioClient.instance.get("$category/$theCategory");
//       logger.v(response);
//       return response;
//     } on DioError catch (e) {
//       var error = DioException.fromDioError(e);
//       throw error.errorMessage;
//     }
//   }
// }
