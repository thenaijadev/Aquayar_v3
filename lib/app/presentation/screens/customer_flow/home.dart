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
  bool noOrder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: !noOrder
          ? SizedBox(
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
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
                        onTap: () {
                          Navigator.pushNamed(context, Routes.orderWater);
                        },
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
                            padding: const EdgeInsets.only(
                                bottom: 15, left: 16, top: 21, right: 22),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0F030D45),
                                blurRadius: 24,
                                offset: Offset(0, 8),
                                spreadRadius: 0,
                              )
                            ],
                            onTap: () {},
                            borderRadius: 25,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TextWidget(
                                        text: "Your water tank   ",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor:
                                            const Color(0xFFF2F2F2),
                                        child: Image.asset(
                                            "assets/images/arrow_right.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          OutlinedContainer(
                            padding: const EdgeInsets.only(
                                bottom: 15, left: 20, top: 21, right: 22),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0F030D45),
                                blurRadius: 24,
                                offset: Offset(0, 8),
                                spreadRadius: 0,
                              )
                            ],
                            onTap: () {},
                            borderRadius: 25,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextWidget(
                                    text: "Your Locations  ",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CircleAvatar(
                                      radius: 16,
                                      backgroundColor: const Color(0xFFF2F2F2),
                                      child: Image.asset(
                                          "assets/images/arrow_right.png"))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Image.asset("assets/images/search.png")),
                            const TextWidget(
                              text: "Orders",
                              fontSize: 16,
                            ),
                            InkWell(
                                onTap: () {},
                                child:
                                    Image.asset("assets/images/calender.png")),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
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
