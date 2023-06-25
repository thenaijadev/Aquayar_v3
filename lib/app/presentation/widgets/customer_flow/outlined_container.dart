import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class OutlinedContainer extends StatelessWidget {
  const OutlinedContainer(
      {super.key,
      this.borderRadius = 10,
      this.padding = const EdgeInsets.all(20),
      this.child = const TextWidget(text: "hi"),
      required this.onTap});
  final double? borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
