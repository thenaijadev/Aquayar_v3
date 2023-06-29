import 'package:aquayar/app/presentation/widgets/onboarding_flow/text_input.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatefulWidget {
  final String content;
  final Alignment alignment;

  const CustomAlert(
      {super.key, required this.content, this.alignment = Alignment.center});

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.transparent,
        child: Align(
          alignment: widget.alignment,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 366,
              height: 380,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFD6E0E9)),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const TextWidget(
                    text: "Rate the driver",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    child: Text(
                      'We take your reviews and complaints very seriously.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF868FAD),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_outline_rounded,
                        size: 40,
                      ),
                      Icon(
                        Icons.star_outline_rounded,
                        size: 40,
                      ),
                      Icon(
                        Icons.star_outline_rounded,
                        size: 40,
                      ),
                      Icon(
                        Icons.star_outline_rounded,
                        size: 40,
                      ),
                      Icon(
                        Icons.star_outline_rounded,
                        size: 40,
                      ),
                    ],
                  ),
                  InputFieldWidget(
                      enabledBorderRadius: 20,
                      maxLines: 6,
                      label: "",
                      verticalContentPadding: 20,
                      hintText: "Type a review",
                      onChanged: (val) {},
                      textFieldkey: formfieldkey_1)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
