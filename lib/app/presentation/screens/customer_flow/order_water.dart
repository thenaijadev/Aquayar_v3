import 'package:aquayar/app/presentation/widgets/customer_flow/for_who_radio_btn.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/rounded_progress_painter.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/water_tank.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/text_input.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/helper_functions.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class OrderWater extends StatefulWidget {
  const OrderWater({super.key});

  @override
  State<OrderWater> createState() => _OrderWaterState();
}

class _OrderWaterState extends State<OrderWater>
    with SingleTickerProviderStateMixin {
  // final ForWho _person = ForWho.myself;
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();

  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    _animationController.animateTo(
      0.14285714285,
    );
    super.initState();
  }

  bool isChosen = true;
  String? countryFlag = "🇳🇬";
  bool? phoneNumberHasError = false;

  String countryCode = "234";
  final formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: OutlinedContainer(
                borderRadius: 25,
                padding: const EdgeInsets.only(top: 0, bottom: 20),
                onTap: () {},
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 12),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RadioBtn(
                    onTap: () {
                      setState(() {
                        isChosen = !isChosen;
                      });
                    },
                    value: "me",
                    isChosen: isChosen,
                    label: "For me",
                  ),
                  RadioBtn(
                    onTap: () {
                      isChosen = !isChosen;
                      setState(() {});
                    },
                    value: "friend",
                    isChosen: !isChosen,
                    label: "For a friend",
                  )
                ],
              ),
            ),
            !isChosen
                ? const Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 20),
                    child: TextWidget(
                      text: "Enter friends phone number",
                      fontSize: 20,
                      color: AppColors.titleBlack,
                    ),
                  )
                : const Text(""),
            !isChosen
                ? Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InputFieldWidget(
                      prefixicon: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  changeCountry(context, (Country country) {
                                    setState(() {
                                      countryFlag = country.flagEmoji;
                                      countryCode = country.phoneCode;
                                    });
                                  });
                                },
                                child: TextWidget(
                                  text: countryFlag!,
                                  fontSize: 20,
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            Image.asset("assets/images/line_vert.png"),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      obscureText: false,
                      textFieldkey: formfieldkey_2,
                      label: "",
                      padding: const EdgeInsets.all(0),
                      hintText: "",
                      hintSize: 20,
                      onChanged: (val) {
                        setState(() {
                          phoneNumberHasError =
                              formfieldkey_2.currentState?.validate();

                          formKey.currentState?.validate();
                        });
                      },
                      validator: (val) {
                        final passwordStatus = Validator.validatePhoneNumber(
                          formfieldkey_2.currentState?.value,
                        );
                        return passwordStatus;
                      },
                    ),
                  )
                : const Text(""),
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: isChosen ? 0 : 20),
              child: const TextWidget(
                text: "Deliver to",
                fontSize: 20,
              ),
            ),
            InputFieldWidget(
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
                    borderRadius: 30,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/images/home.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        const TextWidget(
                          text: "Home",
                          color: Color(0xff623903),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedContainer(
                    borderRadius: 30,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/images/lamp.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        const TextWidget(
                          text: "Location 2",
                          color: Color(0xff868FAE),
                        ),
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
            const Padding(
              padding: EdgeInsets.only(left: 30.0, top: 20),
              child: TextWidget(
                text: "What amount of water do you need?",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedContainer(
                  padding: const EdgeInsets.all(15),
                  onTap: () {
                    if (_animationController.value > 0.14) {
                      _animationController.animateTo(
                          _animationController.value - 0.14285714285);
                    }
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
                          border: Border.all(color: AppColors.inputBorder),
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
                          border: Border.all(color: AppColors.inputBorder),
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
                            valueColor: const Color.fromARGB(255, 17, 150, 245),
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
                    const WaterTank(),
                  ],
                ),
                OutlinedContainer(
                  padding: const EdgeInsets.all(15),
                  onTap: () {
                    _animationController.animateTo(
                      _animationController.value + 0.14285714285,
                    );
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
    );
  }
}

enum ForWho { myself, friend, nobody }
