import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/error/error_screen.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/change_password.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/delete_account.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/edit_location.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/edit_profile.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/help_support_tickets.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/home.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/menu.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/order_water.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/rename_location.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/water_aqired_screen.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/water_tank.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/create_new_password_screen.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/locations.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/home_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/otp_sent.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/password_set_successfully_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/registration_done_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/reset_password.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/gender_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/login_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/otp_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/phone_verification_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/profile_details.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/registration_screen.dart';
import 'package:aquayar/router/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      case Routes.deleteAccount:
        return MaterialPageRoute(
          builder: (_) => const DeleteAccount(),
        );
      case Routes.helpSupportNoTicket:
        return MaterialPageRoute(
          builder: (_) => const HelpSupportTickets(),
        );
      case Routes.waterTank:
        return MaterialPageRoute(
          builder: (_) => const WaterTankScreeen(),
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

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreenNoOrder(),
        );
      case Routes.orderWater:
        return MaterialPageRoute(
          builder: (_) => const OrderWater(),
        );
      case Routes.waterAquired:
        return MaterialPageRoute(
          builder: (_) => const WaterAcquiredScreen(),
        );
      case Routes.locations:
        return MaterialPageRoute(
          builder: (_) => const LocationsScreen(),
        );
      case Routes.editLocation:
        return MaterialPageRoute(
          builder: (_) => const EditLocation(),
        );
      case Routes.menu:
        return MaterialPageRoute(
          builder: (_) => const Menu(),
        );
      case Routes.renameLocation:
        return MaterialPageRoute(
          builder: (_) => const RenameLocation(),
        );

      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfile(),
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
