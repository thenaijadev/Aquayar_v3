import 'package:aquayar/app/presentation/widgets/home_logo_circle.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
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
                      bottomRight: Radius.circular(80))),
            ),
            const Logo()
          ],
        ));
  }
}
