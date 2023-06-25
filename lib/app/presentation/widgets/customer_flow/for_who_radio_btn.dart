import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class RadioBtn extends StatelessWidget {
  const RadioBtn({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
            color: AppColors.inputBorder,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 219, 230, 240), width: 1),
              color: const Color.fromARGB(133, 255, 255, 255),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    stops: [
                      0.1,
                      0.6,
                    ],
                    colors: [
                      Color(0xff61C7F9),
                      Color(0xff0579CE),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextWidget(
            text: label,
            color: const Color(0xff868FAE),
          ),
        ],
      ),
    );
  }
}
