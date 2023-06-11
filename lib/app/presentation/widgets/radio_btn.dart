import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/enums.dart';
import 'package:flutter/material.dart';

class RadioBtns extends StatefulWidget {
  const RadioBtns({super.key});

  @override
  State<RadioBtns> createState() => _RadioBtnsState();
}

class _RadioBtnsState extends State<RadioBtns> {
  String? choice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RadioBtn(
              choice: choice,
              label: Gender.Male.name,
              onPressed: () {
                setState(() {
                  choice = Gender.Male.name;
                });
              }),
          RadioBtn(
              choice: choice,
              label: Gender.Female.name.toString(),
              onPressed: () {
                setState(() {
                  choice = Gender.Female.name;
                });
              }),
          RadioBtn(
              choice: choice,
              label: "Choose not to say",
              onPressed: () {
                setState(() {
                  choice = "Choose not to say";
                });
              })
        ],
      ),
    );
  }
}

class RadioBtn extends StatefulWidget {
  const RadioBtn(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.choice});
  final String label;
  final void Function() onPressed;
  final String? choice;
  @override
  State<RadioBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(widget.choice == widget.label
            ? const Color.fromARGB(255, 7, 142, 238)
            : AppColors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(width: 3, color: Colors.black),
          ),
        ),
      ),
      child: TextWidget(
        text: widget.label,
        color: widget.choice == widget.label
            ? const Color.fromARGB(255, 255, 255, 255)
            : AppColors.textGrey,
      ),
    );
  }
}
