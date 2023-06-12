import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TankSizeRadioBtns extends StatefulWidget {
  const TankSizeRadioBtns({super.key});

  @override
  State<TankSizeRadioBtns> createState() => _TankSizeRadioBtnsState();
}

class _TankSizeRadioBtnsState extends State<TankSizeRadioBtns> {
  String? choice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: TankSizeRadioBtn(
                  label: tankSizes[int],
                  onPressed: () {
                    setState(() {
                      choice = tankSizes[int];
                    });
                  },
                  choice: choice),
            );
          },
          itemCount: tankSizes.length,
        ),
      ),
    );
  }
}

class TankSizeRadioBtn extends StatefulWidget {
  const TankSizeRadioBtn(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.choice});
  final String label;
  final void Function() onPressed;
  final String? choice;
  @override
  State<TankSizeRadioBtn> createState() => _TankSizeRadioBtnState();
}

class _TankSizeRadioBtnState extends State<TankSizeRadioBtn> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
              side: const BorderSide(width: 3, color: Colors.black),
            ),
          ),
        ),
        child: widget.choice == widget.label
            ? Row(
                children: [
                  GradientText("✓",
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                      colors: const [
                        Color(0xff61C7F9),
                        Color(0xff0579CE),
                      ]),
                  const SizedBox(
                    width: 5,
                  ),
                  GradientText(
                    widget.label,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    colors: const [
                      Color(0xff61C7F9),
                      Color(0xff0579CE),
                    ],
                  ),
                ],
              )
            : TextWidget(
                text: widget.label,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 149, 159, 193),
              ));
  }
}

final List<String> tankSizes = [
  "200",
  "500",
  "750",
  "1000",
  "1200",
  "1500",
  "2000",
  "2500",
];
