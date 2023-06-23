import 'package:aquayar/app/presentation/widgets/onboarding_flow/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class RegistrationDoneScreen extends StatefulWidget {
  const RegistrationDoneScreen({super.key});

  @override
  State<RegistrationDoneScreen> createState() => _RegistrationDoneScreenState();
}

class _RegistrationDoneScreenState extends State<RegistrationDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/check_tile.png"),
            const TextWidget(
              text: "You are all set!",
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.titleBlack,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextWidget(
                textAlign: TextAlign.center,
                fontSize: 15,
                text:
                    "We have sent a password recover instructions to your email.",
                color: Color(0xff868FAE),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
              child: BlueBtn(
                  enabled: true,
                  paddingVertical: 12,
                  label: const TextWidget(
                    text: "         Let's go",
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.login);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
