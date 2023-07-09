import 'package:flutter/material.dart';

import 'package:aquayar/utilities/constants.dart/app_colors.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 62,
          width: 62,
          decoration: BoxDecoration(
              color: AppColors.backgroundGrey,
              borderRadius: BorderRadius.circular(80)),
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Transform.scale(scale: 0.9, child: Image.asset(image)),
          ),
        ),
      ],
    );
  }
}
