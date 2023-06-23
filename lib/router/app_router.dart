import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/error/error_screen.dart';
import 'package:aquayar/app/presentation/screens/create_new_password_screen.dart';
import 'package:aquayar/app/presentation/screens/otp_sent.dart';
import 'package:aquayar/app/presentation/screens/password_set_successfully_screen.dart';
import 'package:aquayar/app/presentation/screens/registration_done_screen.dart';
import 'package:aquayar/app/presentation/screens/reset_password.dart';
import 'package:aquayar/app/presentation/screens/gender_screen.dart';
import 'package:aquayar/app/presentation/screens/home_screen.dart';
import 'package:aquayar/app/presentation/screens/login_screen.dart';
import 'package:aquayar/app/presentation/screens/otp_screen.dart';
import 'package:aquayar/app/presentation/screens/phone_verification_screen.dart';
import 'package:aquayar/app/presentation/screens/profile_details.dart';
import 'package:aquayar/app/presentation/screens/registration_screen.dart';
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
      case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.gender:
        var data = routeSettings.arguments as AuthUser;
        return MaterialPageRoute(
          builder: (_) => GenderScreen(data: data),
        );
      case Routes.profileDetails:
        var data = routeSettings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => ProfileDetailsScreen(data: data),
        );
      case Routes.phoneVerification:
        var data = routeSettings.arguments as List;
        return MaterialPageRoute(
          builder: (_) => PhoneVerificationScreen(data: data),
        );
      case Routes.otp:
        var data = routeSettings.arguments as List;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(data: data),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case Routes.emailSent:
        var data = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => OtpSent(
            data: data,
          ),
        );
      case Routes.createNewPassword:
        var data = routeSettings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => CreateNewPasswordScreen(token: data),
        );
      case Routes.createNewPasswordSuccessful:
        return MaterialPageRoute(
          builder: (_) => const PasswordChangeSuccessfulScreen(),
        );

      case Routes.registrationDone:
        return MaterialPageRoute(
          builder: (_) => const RegistrationDoneScreen(),
        );

      // case Routes.payNowScreen:
      //   var data = routeSettings.arguments as CardModel;
      //   return MaterialPageRoute(
      //     builder: (_) => PayNowScreen(card: data),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
