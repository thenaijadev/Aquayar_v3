// import 'package:ecommerce_application/app/data/models/product_model.dart';
// import 'package:equatable/equatable.dart';

// class CartData extends Equatable {
//   final List<ProductModel> shopItems;
//   final int totalAmount;

//   Map productQuantity(products) {
//     var quantity = {};
//     products.forEach((product) {
//       if (!quantity.containsKey(product)) {
//         quantity[product] = 1;
//       } else {
//         quantity[product] += 1;
//       }
//     });
//     return quantity;
//   }

//   @override
//   List<Object?> get props => [
//         totalAmount,
//         shopItems,
//       ];

//   const CartData({
//     required this.shopItems,
//     required this.totalAmount,
//   });
// }
