import 'package:aquayar/app/presentation/screens/customer_flow/delete_account.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/rounded_linear_progress_bar.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/water_tank.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:flutter/material.dart';

class ButtomMapScreenTwo extends StatelessWidget {
  const ButtomMapScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      color: Colors.white,
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
          const HorizontalLineWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Image.asset("assets/images/loading_frame.png"),
          ),
          Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  height: 2,
                  child: const RoundedProgressBar(
                    progress: .3,
                    height: 14,
                    progressColor: Color.fromARGB(199, 4, 121, 205),
                    backgroundColor: Colors.white,
                  )),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const SizedBox(
                          width: 52, height: 52, child: WaterTank(number: 85)),
                      Image.asset("assets/images/water_drop.png")
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Searching nearby drivers...',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: 'You’ll be matched in approx (3) secs',
                        color: Color(0xFF868FAD),
                        fontSize: 14,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
