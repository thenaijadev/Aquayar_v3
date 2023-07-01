import 'package:aquayar/app/presentation/widgets/customer_flow/address_form.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/bottom_sheets.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/rounded_progress_painter.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/water_tank.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class OrderWater extends StatefulWidget {
  const OrderWater({super.key});

  @override
  State<OrderWater> createState() => _OrderWaterState();
}

class _OrderWaterState extends State<OrderWater> with TickerProviderStateMixin {
  // final ForWho _person = ForWho.myself;
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();

  late AnimationController _animationController;
  late AnimationController _animationController_2;
  int count = 0;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    // _animationController.animateTo(
    //   0.14285714285,
    // );

    _animationController_2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    _animationController_2.animateTo(
      0.12,
    );
    super.initState();
  }

  increment() {
    setState(() {
      if (count == 0) {
        liters = 500;
      } else if (count == 1) {
        liters = 750;
      } else if (count == 2) {
        liters = 1000;
      } else if (count == 3) {
        liters = 1200;
      } else if (count == 4) {
        liters = 1500;
      } else if (count == 5) {
        liters = 2000;
      } else if (count == 6) {
        liters = 2500;
      }
    });
    if (count < 7) {
      _animationController.animateTo(_animationController.value + 0.14285714285,
          duration: const Duration(milliseconds: 200));
      _animationController_2.animateTo(_animationController_2.value + 0.035,
          duration: const Duration(milliseconds: 200));
      count++;
    }
  }

  decrement() {
    setState(() {
      if (liters == 500) {
        liters = 0;
      } else if (liters == 750) {
        liters = 500;
      } else if (liters == 1000) {
        liters = 750;
      } else if (liters == 1200) {
        liters = 1000;
      } else if (liters == 1500) {
        liters = 1200;
      } else if (liters == 2000) {
        liters = 1500;
      } else if (liters == 2500) {
        liters = 2000;
      } else if (liters == 2500) {
        liters = liters - 500;
      }
    });
    if (count > 0) {
      _animationController
          .animateTo(_animationController.value - 0.14285714285);

      _animationController_2.animateTo(_animationController_2.value - 0.035);
      count--;
    }
  }

  bool isChosen = true;
  String? countryFlag = "🇳🇬";
  bool? phoneNumberHasError = false;

  String countryCode = "234";
  final formKey = GlobalKey<FormState>();

  int liters = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const TextWidget(
          text: "Order Water",
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.titleBlack,
            size: 25,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 600,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: OutlinedContainer(
                      borderRadius: 25,
                      padding: const EdgeInsets.only(
                        top: 0,
                        bottom: 20,
                      ),
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 21.5),
                            child: Image.asset(
                              "assets/images/truck.png",
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              const SizedBox(
                                width: 240,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 9,
                                    ),
                                    TextWidget(
                                      text: "Your order will be made using",
                                      fontSize: 14,
                                      color: Color(0xff868FAE),
                                    ),
                                    TextWidget(
                                      text: "An LLC Water Truck",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextWidget(
                                      text: "Net: 1500L - 3500L max.",
                                      fontSize: 13,
                                      color: Color(0xff97890C),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 160,
                                top: 30,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xff3FAD57),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.0,
                                        left: 10,
                                        bottom: 3,
                                        right: 10),
                                    child: Center(
                                      child: Center(
                                        child: TextWidget(
                                          text: "VERIFIED",
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AddressForm(
                    onTap: () {
                      showBottomSheetWidget(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 20),
                    child: TextWidget(
                      text: "What amount of water do you need?",
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedContainer(
                        padding: const EdgeInsets.all(15),
                        onTap: () {
                          decrement();
                        },
                        borderRadius: 40,
                        child: const Icon(
                          Icons.remove,
                          size: 30,
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            height: 205,
                            width: 205,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.inputBorder),
                                borderRadius: BorderRadius.circular(200)),
                          ),
                          SizedBox(
                            height: 160,
                            width: 180,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                border:
                                    Border.all(color: AppColors.inputBorder),
                                borderRadius: BorderRadius.circular(80),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    offset: const Offset(2, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: CustomPaint(
                                painter: RoundedProgressPainter(
                                  backgroundColor: const Color(0xffF2F2F2),
                                  valueColor:
                                      const Color.fromARGB(255, 17, 150, 245),
                                  strokeWidth: 20,
                                  value: _animationController
                                      .value, // Replace with your desired value
                                ),
                                child: const SizedBox(
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                          WaterTank(
                            number: _animationController_2.value * 300,
                          ),
                          Column(
                            children: [
                              TextWidget(
                                text: "$liters",
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                              const TextWidget(
                                text: "Litres",
                                fontSize: 15,
                              ),
                            ],
                          )
                        ],
                      ),
                      OutlinedContainer(
                        padding: const EdgeInsets.all(15),
                        onTap: () {
                          increment();
                        },
                        borderRadius: 40,
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.waterAquired);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: Image.asset("assets/images/start_blue.png"),
            ),
          )
        ],
      ),
    );
  }
}

enum ForWho { myself, friend, nobody }
