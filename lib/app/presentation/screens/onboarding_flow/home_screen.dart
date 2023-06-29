import 'package:aquayar/app/presentation/widgets/onboarding_flow/home_logo_circle.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/outlined_btn.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundGrey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),
              const Logo()
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: TextWidget(
                text: "Welcome to Aquayar 👋🏿",
                fontSize: 27,
                fontWeight: FontWeight.w700),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 40),
            child: TextWidget(
              fontSize: 15,
              text: "Aquayar brings you closer to better water services",
              color: Color(0xff868FAE),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.registration);
              },
              child: Image.asset("assets/images/button.png")),
          OutlinedBtn(
            width: 158,
            label: const TextWidget(
              text: "Login",
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            onPressed: () async {
              Navigator.pushNamed(context, Routes.login);
              // final Position position = await UserProvider().getUserLocation();
              // logger.e({position.latitude, position.longitude});
            },
          ),
        ],
      ),
    );
  }
}
