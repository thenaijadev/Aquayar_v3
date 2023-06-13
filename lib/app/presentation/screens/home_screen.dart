import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/home_logo_circle.dart';
import 'package:aquayar/app/presentation/widgets/outlined_btn.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                height: 450,
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
            padding: EdgeInsets.only(top: 80.0),
            child: TextWidget(
                text: "Welcome to Aquayar 👋🏿",
                fontSize: 27,
                fontWeight: FontWeight.w700),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: TextWidget(
              fontSize: 15,
              text: "Aquayar brings you closer to better water services",
              color: Color(0xff868FAE),
            ),
          ),
          BlueBtn(
            onPressed: () {
              Navigator.pushNamed(context, Routes.registration);
            },
            label: const TextWidget(
              text: "Get started for free",
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          OutlinedBtn(
            label: const TextWidget(
              text: "Login",
              fontWeight: FontWeight.w400,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
          )
        ],
      ),
    );
  }
}
