import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/circle_avatar_widget.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/home_tab_widget.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/order.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/show_promotion_bottom_sheet.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.user, required this.orders});
  final AuthUser user;
  final List orders;
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
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            showPromotionBottomSheet(context);
          },
          child: Container(
            width: 340,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabWidget(
                onTap: () {
                  Navigator.pushNamed(context, Routes.waterTank);
                },
                label: "Your Water Tank"),
            TabWidget(
                onTap: () {
                  Navigator.pushNamed(context, Routes.locations);
                },
                label: "Your Locations")
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {}, child: Image.asset("assets/images/search.png")),
              const TextWidget(
                text: "Orders",
                fontSize: 16,
              ),
              InkWell(
                  onTap: () {},
                  child: Image.asset("assets/images/calender.png")),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 300,
          child: ListView(
            children: const [
              Order(
                image: "assets/images/order_icon.png",
              ),
              Order(
                image: "assets/images/completed_order_icon.png",
              ),
              Order(
                image: "assets/images/cancelled_order.png",
              )
            ],
          ),
        )
      ],
    );
  }
}
