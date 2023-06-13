import 'package:aquayar/app/error/error_screen.dart';
import 'package:aquayar/app/presentation/screens/create_new_password_screen.dart';
import 'package:aquayar/app/presentation/screens/email_sent_screen.dart';
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
        return MaterialPageRoute(
          builder: (_) => const GenderScreen(),
        );
      case Routes.profileDetails:
        return MaterialPageRoute(
          builder: (_) => const ProfileDetailsScreen(),
        );
      case Routes.phoneVerification:
        return MaterialPageRoute(
          builder: (_) => const PhoneVerificationScreen(),
        );
      case Routes.otp:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case Routes.emailSent:
        return MaterialPageRoute(
          builder: (_) => const EmailSentScreen(),
        );
      case Routes.createNewPassword:
        return MaterialPageRoute(
          builder: (_) => const CreateNewPasswordScreen(),
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
