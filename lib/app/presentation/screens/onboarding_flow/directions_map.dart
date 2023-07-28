import 'package:aquayar/app/presentation/screens/customer_flow/delete_account.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/map.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:flutter/material.dart';

class DirectionsMapScreen extends StatefulWidget {
  const DirectionsMapScreen({super.key});

  @override
  State<DirectionsMapScreen> createState() => _DirectionsMapScreenState();
}

class _DirectionsMapScreenState extends State<DirectionsMapScreen> {
  bool isLoading = false;
  bool isConnecting = false;
  bool resquestRecieved = false;
  String step = "four";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(right: step == "four" ? 10 : 100.0),
            child: const TextWidget(
              text: "Your delivery is underway...",
              color: Color(0xFF20254F),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .8,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 29, 32, 34),
                  ),
                  borderRadius: BorderRadius.circular(24)),
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
                    const OutlinedContainer(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 24, right: 70),
                      borderRadius: 100,
                      child: Row(
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
                          ),
                        ],
                      ),
                    ),
                    OutlinedContainer(
                        color: Colors.white,
                        borderRadius: 100,
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/red_trash.png"))
                  ],
                ),
              ),
              step == "four"
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 55),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.75, -0.67),
                                    end: Alignment(-0.75, 0.67),
                                    colors: [
                                      Color(0xFF60C6F9),
                                      Color(0xFF0479CD)
                                    ],
                                  ),
                                  shape: OvalBorder(),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x1E000000),
                                      blurRadius: 14,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Image.asset("assets/images/mouse.png"),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          OutlinedContainer(
                            color: Colors.white,
                            borderRadius: 24,
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        TextWidget(
                                            text: "1H",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        TextWidget(
                                          text: "Est. Time",
                                          color: Color(0xFF868FAD),
                                          fontSize: 14,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        TextWidget(
                                            text: "3.4KM",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        TextWidget(
                                          text: "Distance",
                                          color: Color(0xFF868FAD),
                                          fontSize: 14,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        TextWidget(
                                            text: "500",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        TextWidget(
                                          text: "Liters",
                                          color: Color(0xFF868FAD),
                                          fontSize: 14,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16.5,
                                ),
                                const HorizontalLineWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 42,
                                        width: 42,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 4, color: Colors.white)),
                                        child: Image.asset(
                                            "assets/images/head.png"),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const TextWidget(
                                            text: "Henry Immanuel",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Row(
                                            children: [
                                              const TextWidget(
                                                text: "Driver",
                                                color: Color(0xFF868FAD),
                                                fontSize: 12,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const TextWidget(
                                                text: 'ABJ-567-EA',
                                                color: Color(0xFF868FAD),
                                                fontSize: 16,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Image.asset(
                                                  "assets/images/red_dot.png")
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/star_small.png"),
                                              const SizedBox(width: 5),
                                              const TextWidget(
                                                text: "4.3",
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                          const TextWidget(
                                            text: "(246) trips",
                                            fontSize: 14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OutlinedContainer(
                                      borderRadius: 100,
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/chat_icon.png"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const TextWidget(
                                            text: "Chat",
                                            fontSize: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                    OutlinedContainer(
                                      borderRadius: 100,
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/phone.png"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const TextWidget(
                                            text: "Call",
                                            fontSize: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          step = "Five";
                                        });
                                      },
                                      child: const OutlinedContainer(
                                        borderRadius: 200,
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.expand_more_outlined)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32.0, bottom: 55),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          OutlinedContainer(
                            borderRadius: 24,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset("assets/images/timer.png"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const TextWidget(
                                          text: "Est. Time",
                                          color: Color(0xFF868FAD),
                                          fontSize: 14,
                                        ),
                                        const TextWidget(
                                            text: "1H",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(
                                            "assets/images/driving.png"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const TextWidget(
                                          text: "Distance",
                                          color: Color(0xFF868FAD),
                                          fontSize: 14,
                                        ),
                                        const TextWidget(
                                            text: "3.4KM",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset("assets/images/drop.png"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const TextWidget(
                                          text: "Liters",
                                          color: Color(0xFF868FAD),
                                          fontSize: 14,
                                        ),
                                        const TextWidget(
                                            text: "500",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(children: [
                                  Column(children: [
                                    const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Color(0xFFF0F0F0),
                                        child: CircleAvatar(
                                            radius: 5,
                                            backgroundColor:
                                                Color(0xFFADAFC2))),
                                    const SizedBox(
                                      height: 5.5,
                                    ),
                                    Image.asset("assets/images/v_line.png"),
                                    const SizedBox(
                                      height: 5.5,
                                    ),
                                    const CircleAvatar(
                                        radius: 12,
                                        backgroundColor:
                                            Color.fromARGB(94, 63, 173, 87),
                                        child: CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Color(0xFF3FAD57),
                                        )),
                                  ]),
                                  const SizedBox(width: 30),
                                  const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        OutlinedContainer(
                                            borderRadius: 100,
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                                left: 16,
                                                right: 16),
                                            child: TextWidget(
                                                text: "34 Sir Ken Nnamdi Drive",
                                                fontSize: 16,
                                                color: Color(0xff868FAE))),
                                        SizedBox(height: 18),
                                        OutlinedContainer(
                                            borderRadius: 100,
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                                left: 16,
                                                right: 16),
                                            child: TextWidget(
                                                text: "WTC Estate",
                                                fontSize: 16,
                                                color: Color(0xff868FAE)))
                                      ])
                                ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/naira.png",
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: 'Amount',
                                          color: Color(0xFF868FAD),
                                          fontSize: 12,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: '8,500',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                            SizedBox(width: 10),
                                            TextWidget(
                                              text:
                                                  '(Confirmed after scarcity check)',
                                              color: Color(0xFF868FAD),
                                              fontSize: 10.5,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Column(
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const HorizontalLineWidget(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 11.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 42,
                                        width: 42,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 4, color: Colors.white)),
                                        child: Image.asset(
                                            "assets/images/head.png"),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const TextWidget(
                                            text: "Henry Immanuel",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Row(
                                            children: [
                                              const TextWidget(
                                                text: "Driver",
                                                color: Color(0xFF868FAD),
                                                fontSize: 12,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const TextWidget(
                                                text: 'ABJ-567-EA',
                                                color: Color(0xFF868FAD),
                                                fontSize: 16,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Image.asset(
                                                  "assets/images/red_dot.png")
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/star_small.png"),
                                              const SizedBox(width: 5),
                                              const TextWidget(
                                                text: "4.3",
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                          const TextWidget(
                                            text: "(246) trips",
                                            fontSize: 14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.chat);
                                      },
                                      child: OutlinedContainer(
                                        borderRadius: 100,
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 20,
                                            right: 20),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                "assets/images/chat_icon.png"),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const TextWidget(
                                              text: "Chat",
                                              fontSize: 14,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    OutlinedContainer(
                                      borderRadius: 100,
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/phone.png"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const TextWidget(
                                            text: "Call",
                                            fontSize: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          step = "four";
                                        });
                                      },
                                      child: OutlinedContainer(
                                          borderRadius: 200,
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                              "assets/images/x.png")),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
