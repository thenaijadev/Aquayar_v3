import 'package:aquayar/app/presentation/screens/customer_flow/map.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/direction_map_less.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/direction_map_more.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
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
  bool isMapFocused = false;
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
              height: MediaQuery.of(context).size.height * .84,
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
                          horizontal: 32.0, vertical: 40),
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
                          DirectionMapScreenLess(showMoreOnTap: () {
                            setState(() {
                              step = "five";
                            });
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )
                  : DirectionMapScreenMore(showLessOnMap: () {
                      setState(() {
                        step = "four";
                      });
                    })
            ],
          ),
        ],
      ),
    );
  }
}
