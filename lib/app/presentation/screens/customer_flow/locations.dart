import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  bool isVisible = false;
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const TextWidget(
            text: "Your Locations",
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.titleBlack,
              size: 25,
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 18.0,
                    left: 18,
                    right: 18,
                  ),
                  child: OutlinedContainer(
                    onTap: () {},
                    borderRadius: 22,
                    padding: const EdgeInsets.only(
                        left: 24, bottom: 16, top: 16, right: 21),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/brown_house.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const TextWidget(
                                    text: "Home",
                                    color: Color(0xFF623903),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const TextWidget(
                                text: "33B Sir Ken Nnamdi Drive",
                                color: Color(0xFF20254F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                  number = 1;
                                });
                              },
                              child: Image.asset("assets/images/menu.png"))
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    left: 18,
                    right: 18,
                  ),
                  child: OutlinedContainer(
                    borderRadius: 22,
                    padding: const EdgeInsets.only(
                        left: 24, bottom: 16, top: 16, right: 21),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/green_lamp.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const TextWidget(
                                    text: "Home",
                                    color: Color(0xFF85A407),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const TextWidget(
                                text: "33B Sir Ken Nnamdi Drive",
                                color: Color(0xFF20254F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                  number = 2;
                                });
                              },
                              child: Image.asset("assets/images/menu.png"))
                        ]),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isVisible,
              child: Positioned(
                top: number == 1 ? 80 : 180,
                right: 40,
                child: OutlinedContainer(
                  borderRadius: 22,
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 14, left: 16, right: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.editLocation);
                          setState(() {
                            isVisible = false;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/images/pen_icon.png"),
                            const SizedBox(
                              width: 5,
                            ),
                            const TextWidget(
                              text: "Edit Work Address",
                              color: Color(0xFF868FAD),
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = false;
                          });
                          Navigator.pushNamed(context, Routes.renameLocation);
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/images/note.png"),
                            const SizedBox(
                              width: 5,
                            ),
                            const TextWidget(
                              text: "Rename",
                              color: Color(0xFF868FAD),
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/trash.png"),
                          const SizedBox(
                            width: 5,
                          ),
                          const TextWidget(
                            text: "Delete",
                            color: Color(0xFF868FAD),
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
