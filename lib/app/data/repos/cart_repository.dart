// import 'package:ecommerce_application/app/bloc/cart/cart_bloc.dart';
// import 'package:ecommerce_application/app/data/interfaces/cart_repository_interface.dart';
// import 'package:ecommerce_application/app/data/models/cart_data.dart';
// import 'package:ecommerce_application/app/data/models/product_model.dart';

// class CartRepository implements CartRepositoryInterface {
//   static final CartRepository cartRepository = CartRepository._();
//   factory CartRepository() {
//     return cartRepository;
//   }
//   CartRepository._();
//   @override
//   CartState addToCart(CartProductAdded event, CartState state) {
//     if (state is CartLoaded) {
//       List<ProductModel> shopItems = List.from(state.cart.shopItems)
//         ..add(event.product!);

//       double totalAmount = 0;
//       for (final product in shopItems) {
//         totalAmount = product.price! + totalAmount;
//       }

//       return CartLoaded(
//         cart: CartData(
//             shopItems: shopItems, totalAmount: totalAmount.round().toInt()),
//       );
//     } else {
//       return CartError();
//     }
//   }

//   @override
//   CartData getCart() {
//     // TODO: implement getCart
//     throw UnimplementedError();
//   }

//   @override
//   CartState removeFromCart(CartProductRemoved event, CartState state) {
//     if (state is CartLoaded) {
//       List<ProductModel> shopItems = List.from(state.cart.shopItems)
//         ..remove(event.product);

//       double totalAmount = 0;
//       for (final product in shopItems) {
//         totalAmount = (-product.price! + totalAmount);
//       }

//       return CartLoaded(
//         cart: CartData(
//             shopItems: shopItems, totalAmount: -totalAmount.round().toInt()),
//       );
//     } else {
//       return CartError();
//     }
//   }
// }
