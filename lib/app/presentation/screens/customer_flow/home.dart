import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreenNoOrder extends StatefulWidget {
  const HomeScreenNoOrder({super.key});

  @override
  State<HomeScreenNoOrder> createState() => _HomeScreenNoOrderState();
}

class _HomeScreenNoOrderState extends State<HomeScreenNoOrder> {
  bool noOrder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: noOrder
                ? [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatarWidget(
                          image: "assets/images/head.png",
                        ),
                        CircleAvatarWidget(
                          image: "assets/images/bell.png",
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextWidget(
                      text: "Good Morning",
                      fontSize: 30,
                    ),
                    const TextWidget(
                      text: "Daniel",
                      fontSize: 25,
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
                        text:
                            "It's deserted here. Make your first water booking 😊 .",
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    OutlinedContainer(
                      onTap: () {},
                      borderRadius: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
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
                  ]
                : [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatarWidget(
                          image: "assets/images/head.png",
                        ),
                        CircleAvatarWidget(
                          image: "assets/images/bell.png",
                        )
                      ],
                    ),
                    const TextWidget(
                      text: "Good Morning",
                      fontSize: 30,
                    ),
                    const TextWidget(
                      text: "Daniel",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 340,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedContainer(
                          onTap: () {},
                          borderRadius: 25,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "Your water tank",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: AppColors.inputBorder,
                                  child: Icon(Icons.chevron_right,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        OutlinedContainer(
                          onTap: () {},
                          borderRadius: 25,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "Your Locations",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: AppColors.inputBorder,
                                  child: Icon(Icons.chevron_right,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Image.asset("assets/images/search.png")),
                        const TextWidget(
                          text: "Orders",
                          fontSize: 20,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image.asset("assets/images/calender.png")),
                      ],
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: AppColors.backgroundGrey,
              borderRadius: BorderRadius.circular(80)),
        ),
        Container(
          height: 68,
          width: 68,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Image.asset(image),
          ),
        ),
      ],
    );
  }
}

class OutlinedContainer extends StatelessWidget {
  const OutlinedContainer(
      {super.key,
      this.borderRadius = 10,
      this.padding = const EdgeInsets.all(20),
      this.child = const TextWidget(text: "hi"),
      required this.onTap});
  final double? borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            border: Border.all(color: AppColors.inputBorder)),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
