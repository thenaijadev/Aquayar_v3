// import 'package:dio/dio.dart';
// import 'package:ecommerce_application/app/data/utilities/api_endpoint.dart';
// import 'package:ecommerce_application/app/data/utilities/dio_client.dart';
// import 'package:ecommerce_application/app/data/utilities/dio_exception.dart';
// import 'package:ecommerce_application/utilities/logger.dart';

// class ProductProvider {
//   static Future<List<dynamic>> getProduct() async {
//     try {
//       final response = await DioClient.instance.get(products);
//       logger.v(response);
//       return response;
//     } on DioError catch (e) {
//       var error = DioException.fromDioError(e);
//       throw error.errorMessage;
//     }
//   }
// }
// // 