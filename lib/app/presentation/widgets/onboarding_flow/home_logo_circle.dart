import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 390,
      child: Material(
        elevation: 10,
        borderRadius: const BorderRadius.all(Radius.circular(60)),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 60,
          child: CircleAvatar(
            backgroundColor: const Color(0xffe6eaf0),
            radius: 58,
            child: Image.asset("assets/images/home_logo.png"),
          ),
        ),
      ),
    );
  }
}
