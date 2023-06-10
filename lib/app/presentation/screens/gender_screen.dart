import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/enums.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final GlobalKey<FormFieldState> textFieldkey = GlobalKey<FormFieldState>();
  bool? nameHasError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.titleBlack,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Center(
                child: TextWidget(
                  text: "What should we call you?",
                  color: AppColors.titleBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100.0, vertical: 30),
                  child: TextFormField(
                    validator: (val) {
                      final nameError = Validator.validateText(
                          textFieldkey.currentState?.value, "Username");
                      return nameError;
                    },
                    onChanged: (val) {
                      setState(() {
                        nameHasError = textFieldkey.currentState?.validate();
                      });
                    },
                    key: textFieldkey,
                    cursorColor: AppColors.inputBorder,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
              const RadioBtns(),
            ],
          ),
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextWidget(
                    text: "Use a minimum of 3 characters with no spaces",
                    color: Color(0xff868FAE),
                    fontSize: 13,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BlueBtn(
                    enabled: nameHasError!,
                    paddingVertical: 12,
                    label: TextWidget(
                      text: "      Continue",
                      color: nameHasError!
                          ? AppColors.white
                          : AppColors.inputBorder,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    onPressed: () {}),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RadioBtns extends StatefulWidget {
  const RadioBtns({super.key});

  @override
  State<RadioBtns> createState() => _RadioBtnsState();
}

class _RadioBtnsState extends State<RadioBtns> {
  String choice = "";
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
  final String choice;
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
