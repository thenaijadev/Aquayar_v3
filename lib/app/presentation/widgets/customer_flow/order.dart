import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order(
      {super.key,
      required this.image,
      required this.order,
      required this.address});
  final String image;
  final Map<String, dynamic> order;
  final String address;
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  void initState() {
    super.initState();
  }

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
              child: Image.asset(widget.image),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 90,
                  child: TextWidget(
                    text: widget.address,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextWidget(
                  text: widget.order["status"].toString().toUpperCase(),
                  color: const Color(0xFF868FAD),
                )
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: widget.order["waterSize"].toString(),
                  fontWeight: FontWeight.bold,
                ),
                const TextWidget(
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
