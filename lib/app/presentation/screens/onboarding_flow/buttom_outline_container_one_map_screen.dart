import 'package:aquayar/app/presentation/screens/customer_flow/delete_account.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/rounded_linear_progress_bar.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:flutter/material.dart';

class ButtomMapScreenOne extends StatelessWidget {
  const ButtomMapScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      borderRadius: 24,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/timer.png",
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "1H 25M - 1H 25M",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text: 'Estimated Time of Delivery',
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Row(
                children: [
                  Image.asset("assets/images/drop.png"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Column(
                    children: [
                      TextWidget(
                        text: "500",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: "Liters",
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16.5,
          ),
          const HorizontalLineWidget(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/naira.png",
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Amount to Pay',
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  ),
                  TextWidget(
                    text: '8,500 - 8,900',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  const TextWidget(
                    text: 'Scarcity level',
                    color: Color(0xFF868FAD),
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                      width: 80,
                      decoration: const BoxDecoration(),
                      height: 10,
                      child: const RoundedProgressBar(
                        progress: .7,
                        height: 14,
                        progressColor: Color(0xff4e8000),
                        backgroundColor: Colors.white,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
