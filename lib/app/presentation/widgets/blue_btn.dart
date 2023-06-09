import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class BlueBtn extends StatelessWidget {
  const BlueBtn({
    super.key,
    required this.label,
    required this.onPressed,
    this.paddingHorizontal = 15,
    this.paddingVertical = 15,
    this.width,
    this.enabled = true,
  });
  final Widget label;
  final void Function() onPressed;
  final double paddingHorizontal;
  final double paddingVertical;
  final double? width;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          elevation: enabled ? 5 : 0,
          shadowColor: const Color(0xff61C7F9),
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(
                vertical: paddingVertical, horizontal: paddingHorizontal),
            decoration: enabled
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      stops: [
                        0.1,
                        0.6,
                      ],
                      colors: [
                        Color(0xff61C7F9),
                        Color.fromARGB(255, 4, 136, 231),
                      ],
                    ),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.disabledBtn),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 100,
                ),
                label,
                const Flexible(
                  child: SizedBox(
                    width: 160,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: enabled ? AppColors.white : AppColors.inputBorder,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
