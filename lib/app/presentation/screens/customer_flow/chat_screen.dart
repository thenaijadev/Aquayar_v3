import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0.2,
        shadowColor: const Color(0xFF868FAD),
        backgroundColor: Colors.white,
        leading:
            GestureDetector(child: Image.asset("assets/images/arrow_left.png")),
        title: Row(
          children: [
            Image.asset("assets/images/head_shot.png"),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text: "Henry immanuel",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    const TextWidget(
                      text: "Driver",
                      color: Color(0xFF868FAD),
                      fontSize: 14,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset("assets/images/star_small.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    const TextWidget(text: "4.3")
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 35,
            ),
            OutlinedContainer(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F030D45),
                  blurRadius: 24,
                  offset: Offset(0, 8),
                  spreadRadius: 0,
                )
              ],
              borderRadius: 100,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 15, right: 15),
              child: Row(
                children: [
                  Image.asset("assets/images/phone.png"),
                  const SizedBox(
                    width: 6,
                  ),
                  const TextWidget(
                    text: "Call",
                    fontSize: 14,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
