import 'package:aquayar/app/presentation/screens/customer_flow/delete_account.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:flutter/material.dart';

class DirectionMapScreenLess extends StatelessWidget {
  const DirectionMapScreenLess({super.key, required this.showMoreOnTap});
  final void Function() showMoreOnTap;
  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      color: Colors.white,
      borderRadius: 24,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextWidget(
                      text: "1H", fontSize: 20, fontWeight: FontWeight.bold),
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
                      text: "3.4KM", fontSize: 20, fontWeight: FontWeight.bold),
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
                      text: "500", fontSize: 20, fontWeight: FontWeight.bold),
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
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 4, color: Colors.white)),
                  child: Image.asset("assets/images/head.png"),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        Image.asset("assets/images/red_dot.png")
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
                        Image.asset("assets/images/star_small.png"),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedContainer(
                borderRadius: 100,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Row(
                  children: [
                    Image.asset("assets/images/chat_icon.png"),
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
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Row(
                  children: [
                    Image.asset("assets/images/phone.png"),
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
                onTap: showMoreOnTap,
                child: const OutlinedContainer(
                  borderRadius: 200,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [Icon(Icons.expand_more_outlined)],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
