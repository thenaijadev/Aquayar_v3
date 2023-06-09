import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class OAuthBtn extends StatelessWidget {
  const OAuthBtn(
      {super.key,
      required this.image,
      required this.label,
      required this.onPressed});
  final String image;
  final String label;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
              color: AppColors.inputBorder,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            height: 48,
            width: 348,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                const SizedBox(
                  width: 10,
                ),
                const TextWidget(
                  text: "Sign in with Google",
                  color: AppColors.titleBlack,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
