import 'package:aquayar/app/presentation/screens/customer_flow/home.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset("assets/images/menu_x.png"),
        ),
        title: Container(
          width: 181,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.inputBorder),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F030D45),
                blurRadius: 24,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/location_pin.png"),
              const SizedBox(
                width: 6,
              ),
              const TextWidget(
                text: "Enugu, Nigeria",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 21.0),
                child: Row(
                  children: [
                    const CircleAvatarWidget(
                      image: "assets/images/head.png",
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          text: "Daniel",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            const TextWidget(
                              text: 'frankpeterani@gmail.com',
                              color: Color(0xFF868FAD),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            Image.asset("assets/images/tick_circle.png")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29, bottom: 4),
                child: Container(
                  width: 396,
                  height: 67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment(0.63, -0.78),
                      end: Alignment(-0.63, 0.78),
                      colors: [Color(0xFF6F6CF8), Color(0xFF4725F7)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24),
                    child: Row(
                      children: [
                        Image.asset("assets/images/star_small.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Completed Orders",
                              color: Colors.white,
                            ),
                            TextWidget(
                                text: "12",
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                          ],
                        ),
                        const SizedBox(width: 70),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Beginner",
                              color: Colors.white,
                            ),
                            TextWidget(
                              text: "Level 1",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextWidget(
                    text: "Next in: 3",
                    color: Color(0xFF868FAD),
                  ),
                  TextWidget(
                    text: "Next in: 3",
                    color: Color(0xFF868FAD),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: OutlinedContainer(
                  borderRadius: 24,
                  color: const Color(0xFFFAFAFA),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.editProfile);
                              },
                              child: Row(
                                children: [
                                  Image.asset("assets/images/user_icon.png"),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const TextWidget(
                                    text: "Edit Profile",
                                    color: Color(0xFF868FAD),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset("assets/images/chevron_right.png"),
                          ],
                        ),
                      ),
                      const HorizontalRuleWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  Routes.changePassword,
                                );
                              },
                              child: Row(
                                children: [
                                  Image.asset("assets/images/key_icon.png"),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const TextWidget(
                                    text: "Change Password",
                                    color: Color(0xFF868FAD),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset("assets/images/chevron_right.png"),
                          ],
                        ),
                      ),
                      const HorizontalRuleWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/bubble.png"),
                                const SizedBox(
                                  width: 12,
                                ),
                                const TextWidget(
                                  text: "Your Water Tank",
                                  color: Color(0xFF868FAD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Image.asset("assets/images/chevron_right.png"),
                          ],
                        ),
                      ),
                      const HorizontalRuleWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.locations);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/routing.png"),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const TextWidget(
                                    text: "Your Locations",
                                    color: Color(0xFF868FAD),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Image.asset("assets/images/chevron_right.png"),
                            ],
                          ),
                        ),
                      ),
                      const HorizontalRuleWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/moon.png"),
                                const SizedBox(
                                  width: 12,
                                ),
                                const TextWidget(
                                  text: "Dark Theme",
                                  color: Color(0xFF868FAD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              width: 38,
                              child: FlutterSwitch(
                                width: 125.0,
                                height: 55.0,
                                valueFontSize: 25.0,
                                toggleSize: 13.0,
                                inactiveColor: Colors.white,
                                inactiveSwitchBorder: Border.all(
                                  color: const Color(0xFF868FAD),
                                ),
                                toggleBorder: Border.all(
                                    color: const Color(0xFF868FAD), width: 9),
                                value: light,
                                borderRadius: 10.0,
                                padding: 2.0,
                                onToggle: (val) {
                                  setState(() {
                                    light = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: OutlinedContainer(
                  borderRadius: 24,
                  color: const Color(0xFFFAFAFA),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/chat.png"),
                                const SizedBox(
                                  width: 12,
                                ),
                                const TextWidget(
                                  text: "Help & Support",
                                  color: Color(0xFF868FAD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Image.asset("assets/images/chevron_right.png"),
                          ],
                        ),
                      ),
                      const HorizontalRuleWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/message.png"),
                                const SizedBox(
                                  width: 12,
                                ),
                                const TextWidget(
                                  text: "Give Feedback",
                                  color: Color(0xFF868FAD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Image.asset("assets/images/chevron_right.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: OutlinedContainer(
                  borderRadius: 24,
                  color: const Color(0xFFFAFAFA),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/bin.png"),
                            const SizedBox(
                              width: 12,
                            ),
                            const TextWidget(
                              text: "Delete Account",
                              color: Color(0xFFC0362C),
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Image.asset("assets/images/chevron_right.png"),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: OutlinedContainer(
                  borderRadius: 24,
                  color: Color(0xFFFAFAFA),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "Logout",
                          color: Color(0xFFC0362C),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalRuleWidget extends StatelessWidget {
  const HorizontalRuleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD6E0E9),
      width: double.infinity,
      height: 1,
    );
  }
}
