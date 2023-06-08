// import 'package:ecommerce_application/app/data/models/product_model.dart';
// import 'package:ecommerce_application/app/data/providers/product_provider.dart';
// import 'package:ecommerce_application/app/data/providers/category_provider.dart';

// class ProductRepository {
//   static Future<List<ProductModel>> getProducts() async {
//     final List<dynamic> products = await ProductProvider.getProduct();

//     List<ProductModel> productsList = [];

//     for (final e in products) {
//       productsList.add(ProductModel.fromJson(e));
//     }
//     return productsList;
//   }

//   static Future<List<ProductModel>> getProductsByCategory(
//       String category) async {
//     final List<dynamic> products =
//         await CategoriesProvider.getProductsByCategory(category);

//     List<ProductModel> productsList = [];

//     for (final e in products) {
//       productsList.add(ProductModel.fromJson(e));
//     }
//     return productsList;
//   }
// }
