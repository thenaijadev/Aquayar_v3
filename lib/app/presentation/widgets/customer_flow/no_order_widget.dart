import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/circle_avatar_widget.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:flutter/material.dart';

class NoOrderWidget extends StatelessWidget {
  const NoOrderWidget({super.key, required this.user});
  final AquayarAuthUser user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.menu, arguments: user);
              },
              child: const CircleAvatarWidget(
                image: "assets/images/head.png",
              ),
            ),
            const CircleAvatarWidget(
              image: "assets/images/bell.png",
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const TextWidget(
          text: "Good Morning,",
          fontSize: 32,
        ),
        TextWidget(
          text: user.displayName!,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 100,
        ),
        Image.asset("assets/images/cactus.png"),
        const SizedBox(
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: TextWidget(
            textAlign: TextAlign.center,
            fontSize: 22,
            text: "It's deserted here. Make your first water booking 😊 .",
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedContainer(
          onTap: () {
            // Navigator.pushNamed(context, Routes.orderWater);
            Navigator.pushNamed(context, Routes.orderWater);
          },
          borderRadius: 40,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              TextWidget(
                text: "Order Water",
                fontWeight: FontWeight.bold,
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 30,
              ),
            ],
          ),
        )
      ],
    );
  }
}
