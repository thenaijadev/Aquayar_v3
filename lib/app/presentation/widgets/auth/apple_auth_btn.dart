import 'package:aquayar/app/presentation/widgets/auth/oauth_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpWithApple extends StatelessWidget {
  const SignUpWithApple({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: OutlinedButtonWidget(
          image: Image.asset(
            "assets/images/apple.png",
          ),
          label: "Log in with Apple",
          onPressed: onPressed,
        ),
      );
    }
    return const Text("");
  }
}
