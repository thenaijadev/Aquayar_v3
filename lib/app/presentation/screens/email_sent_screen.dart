import 'package:aquayar/app/presentation/widgets/outlined_btn.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class EmailSentScreen extends StatefulWidget {
  const EmailSentScreen({super.key});

  @override
  State<EmailSentScreen> createState() => _EmailSentScreenState();
}

class _EmailSentScreenState extends State<EmailSentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset("assets/images/email.png"),
                ),
                const TextWidget(
                  text: "Check your mail",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titleBlack,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextWidget(
                    textAlign: TextAlign.center,
                    fontSize: 15,
                    text:
                        "We have sent a password recover instructions to your email.",
                    color: Color(0xff868FAE),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedBtn(
                        width: 20,
                        label: const TextWidget(
                          text: "Skip, I'll confirm later",
                          fontWeight: FontWeight.w500,
                          color: AppColors.titleBlack,
                        ),
                        onPressed: () {},
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.createNewPassword);
                        },
                        child: Container(
                          width: 170,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                              stops: [
                                0.1,
                                0.6,
                              ],
                              colors: [
                                Color(0xff61C7F9),
                                Color.fromARGB(255, 4, 136, 231),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: TextWidget(
                                text: "Open email app",
                                color: AppColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const TextWidget(
                    textAlign: TextAlign.center,
                    text:
                        "Did not recieve the email? Check the spam filter or"),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: GradientText("try another email address",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      colors: const [
                        Color(0xff61C7F9),
                        Color(0xff0579CE),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
