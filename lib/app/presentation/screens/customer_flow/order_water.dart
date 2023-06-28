import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/rounded_progress_painter.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/water_tank.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/text_input.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
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
                      padding: const EdgeInsets.only(top: 0, bottom: 20),
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 12),
                            child: Image.asset(
                              "assets/images/truck.png",
                              width: 98,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 9,
                                ),
                                TextWidget(
                                  text: "Your order will be made using",
                                  fontSize: 13,
                                  color: Color(0xff868FAE),
                                ),
                                TextWidget(
                                  text: "An LLC Water Truck",
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: "Net: 1500L - 3500L max.",
                                  fontSize: 13,
                                  color: Color(0xff97890C),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff3FAD57),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 15),
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AddressForm(
                    onTap: () {
                      showBottomSheet(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 20),
                    child: TextWidget(
                      text: "What amount of water do you need?",
                    ),
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
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          BlueBtn(
              label: const TextWidget(
                text: "              Start",
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}

enum ForWho { myself, friend, nobody }

class AddressForm extends StatefulWidget {
  const AddressForm({super.key, this.onTap});
  final void Function()? onTap;
  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  bool isHome = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 15),
          child: TextWidget(
            text: "Deliver to",
            fontSize: 20,
          ),
        ),
        InputFieldWidget(
            onTap: widget.onTap,
            padding: const EdgeInsets.all(0),
            label: "",
            hintText: "Enter Address",
            onChanged: (val) {},
            textFieldkey: formfieldkey_1),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            children: [
              OutlinedContainer(
                color: isHome ? const Color(0xffFEF1E2) : Colors.transparent,
                borderColor:
                    isHome ? const Color(0xff623903) : const Color(0xff868FAE),
                borderRadius: 30,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                onTap: () {
                  setState(() {
                    isHome = true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.home,
                      color: isHome
                          ? const Color(0xff623903)
                          : const Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: "Home",
                      color: isHome
                          ? const Color(0xff623903)
                          : const Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    isHome ? const Icon(Icons.check) : const Text(""),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              OutlinedContainer(
                color: !isHome ? const Color(0xffFEF1E2) : Colors.transparent,
                borderColor:
                    !isHome ? const Color(0xff623903) : const Color(0xff868FAE),
                borderRadius: 30,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                onTap: () {
                  setState(() {
                    isHome = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.lightbulb_outline_rounded,
                      color: !isHome
                          ? const Color(0xff623903)
                          : const Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: "Location 2",
                      color: !isHome
                          ? const Color(0xff623903)
                          : const Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    !isHome ? const Icon(Icons.check) : const Text(""),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              OutlinedContainer(
                padding: const EdgeInsets.all(10),
                borderRadius: 20,
                onTap: () {},
                child: Image.asset("assets/images/pen_icon.png"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

void showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.rotate(
                    angle: 45 * 0.0174533, // 90 degrees in radians
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.add,
                          weight: 1,
                          size: 35,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const AddressForm(),
              Row(
                children: [
                  Image.asset("assets/images/location_pin.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    children: [
                      TextWidget(
                        text: "WTC Estate",
                        textAlign: TextAlign.left,
                      ),
                      TextWidget(text: "Odoeze St, Enugu,Nigeria")
                    ],
                  )
                ],
              )
            ],
          ));
    },
  );
}
