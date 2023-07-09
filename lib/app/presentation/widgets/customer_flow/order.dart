import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedContainer(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        color: const Color(0xFFFAFAFA),
        onTap: () {},
        borderRadius: 30,
        child: Row(
          children: [
            Center(
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "WTC Estate",
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  text: "Active",
                  color: Color(0xFF868FAD),
                )
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "500",
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  text: "Liters",
                  color: AppColors.hintColor,
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                  backgroundColor: const Color(0xFFF2F2F2),
                  radius: 14,
                  child: Image.asset("assets/images/arrow_right.png")),
            )
          ],
        ),
      ),
    );
  }
}
