import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/text_input.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
              child: ListView(
            children: const [],
          )),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Color(0xFF868FAD), width: .3))),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextWidget(
                    text: "😂",
                    fontSize: 30,
                  ),
                  SizedBox(
                    height: 110,
                    width: 284,
                    child: InputFieldWidget(
                        label: "",
                        hintText: "Type your message",
                        onChanged: (val) {},
                        textFieldkey: formfieldkey_1),
                  ),
                  OutlinedContainer(
                    padding: const EdgeInsets.all(10),
                    borderRadius: 100,
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x33030D45),
                        blurRadius: 32,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                    child: Image.asset("assets/images/send_plane.png"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
