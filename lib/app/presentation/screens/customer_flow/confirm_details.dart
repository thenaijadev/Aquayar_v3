import 'package:aquayar/app/presentation/screens/customer_flow/map.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/blue_icon_map_scrreen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/buttom_outline_container_map_screen_two.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/buttom_outline_container_one_map_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/payment_container_map_screen.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class ConfirmDetails extends StatefulWidget {
  const ConfirmDetails({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<ConfirmDetails> createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
  String step = "one";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(right: step == "four" ? 10 : 100.0),
            child: TextWidget(
              text: step == "one"
                  ? "Confirm Details"
                  : step == "two"
                      ? "Request Recieved"
                      : step == "three"
                          ? "Request Recieved"
                          : "Your delivery is underway...",
              color: const Color(0xFF20254F),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/images/arrow_left.png",
              width: 24,
            ),
          )),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 26),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.inputBorder,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const MapSample(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedContainer(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 24,
                          right: step == "four" ? 70 : 125),
                      borderRadius: 100,
                      child: const Row(
                        children: [
                          TextWidget(
                            text: "Delivering to:",
                            color: Color(0xFFADAFC2),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextWidget(
                            text: "WTC Estate",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: step == "one" ? 20 : 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        step == "one"
                            ? const PaymentContainerMapScreen()
                            : const Text(""),
                        const BlueArrowMouseIcon(),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    step == "one"
                        ? const ButtomMapScreenOne()
                        : step == "two"
                            ? const ButtomMapScreenTwo()
                            : const Text(''),
                    const SizedBox(
                      height: 15,
                    ),
                    step == "one"
                        ? Transform.scale(
                            scaleX: 1.07,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  step = "two";
                                });
                              },
                              child: Image.asset(
                                "assets/images/confirm_blue.png",
                              ),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
