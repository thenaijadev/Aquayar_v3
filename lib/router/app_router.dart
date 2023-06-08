import 'package:aquayar/app/error/error_screen.dart';
import 'package:aquayar/app/presentation/screens/home_screen.dart';
import 'package:aquayar/router/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      // case Routes.cartScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const CartScreen(),
      //   );
      // case Routes.productScreen:
      //   var data = routeSettings.arguments as ProductModel;
      //   return MaterialPageRoute(
      //     builder: (_) => ProductScreen(product: data),
      //   );
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginScreen(),
      //   );

      // case Routes.passwordRecoveryScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const PasswordRecoveryScreen(),
      //   );
      // case Routes.otpVerifcationScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OTPVerificationScreen(),
      //   );

      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
      // case Routes.payNowScreen:
      //   var data = routeSettings.arguments as CardModel;
      //   return MaterialPageRoute(
      //     builder: (_) => PayNowScreen(card: data),
      //   );
      // case Routes.paymentScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const PaymentChoiceScreen(),
      //   );
      // case Routes.orderDetails:
      //   return MaterialPageRoute(
      //     builder: (_) => const OrderDetails(),
      //   );
      // case Routes.registration:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegistrationScreen(),
      //   );
      // case Routes.loading:
      //   return MaterialPageRoute(
      //     builder: (_) => const LoadingScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
