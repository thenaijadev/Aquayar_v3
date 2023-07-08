import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class HomeScreenNoOrder extends StatefulWidget {
  const HomeScreenNoOrder({super.key, required this.user});
  final AuthUser user;
  @override
  State<HomeScreenNoOrder> createState() => _HomeScreenNoOrderState();
}

class _HomeScreenNoOrderState extends State<HomeScreenNoOrder> {
  bool noOrder = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.orderWater);
          },
          child: ClayContainer(
            color: const Color.fromARGB(255, 4, 136, 231),
            parentColor: Colors.white,
            height: 150,
            width: 250,
            depth: 40,
            borderRadius: 75,
            curveType: CurveType.convex,
            child: Image.asset("assets/images/drop_icon.png"),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: noOrder
                  ? [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.menu,
                                  arguments: widget.user);
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
                      const SizedBox(
                        height: 20,
                      ),
                      const TextWidget(
                        text: "Good Morning,",
                        fontSize: 32,
                      ),
                      TextWidget(
                        text: widget.user.displayName!,
                        fontSize: 32,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.menu);
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
                        text: widget.user.displayName!,
                        fontSize: 32,
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
                      const SizedBox(height: 30),
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
            ),
          ),
        ),
      ),
    );
  }
}

class Order extends StatelessWidget {
  const Order({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedContainer(
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
                TextWidget(text: "Active")
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
              child: const CircleAvatar(
                backgroundColor: AppColors.inputBorder,
                radius: 14,
                child: Icon(Icons.chevron_right),
              ),
            )
          ],
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
          height: 62,
          width: 62,
          decoration: BoxDecoration(
              color: AppColors.backgroundGrey,
              borderRadius: BorderRadius.circular(80)),
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Transform.scale(scale: 0.9, child: Image.asset(image)),
          ),
        ),
      ],
    );
  }
}
