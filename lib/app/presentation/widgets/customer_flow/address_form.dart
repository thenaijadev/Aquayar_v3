import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/text_input.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  const AddressForm(
      {super.key,
      this.onTap,
      this.labelFontWeight = FontWeight.normal,
      required this.labelFontSize});
  final void Function()? onTap;
  final FontWeight labelFontWeight;
  final double labelFontSize;
  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  bool isHome = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: InputFieldWidget(
              labelFontSize: widget.labelFontSize,
              onTap: widget.onTap,
              fontWeight: widget.labelFontWeight,
              verticalContentPadding: 0,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset("assets/images/x_circle.png"),
              ),
              label: "Deliver to",
              hintText: "Enter Address",
              onChanged: (val) {},
              textFieldkey: formfieldkey_1),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedContainer(
                color: isHome ? const Color(0xffFEF1E2) : Colors.transparent,
                borderColor:
                    isHome ? const Color(0xff623903) : const Color(0xff868FAE),
                borderRadius: 30,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                onTap: () {
                  setState(() {
                    isHome = true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: isHome
                          ? const Color(0xff623903)
                          : const Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: "Home",
                      color: isHome
                          ? const Color(0xff623903)
                          : const Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    isHome ? const Icon(Icons.check) : const Text(""),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              OutlinedContainer(
                color: !isHome ? const Color(0xffFEF1E2) : Colors.transparent,
                borderColor:
                    !isHome ? const Color(0xff623903) : const Color(0xff868FAE),
                borderRadius: 30,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                onTap: () {
                  setState(() {
                    isHome = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.lightbulb_outline_rounded,
                      color: !isHome
                          ? const Color(0xff623903)
                          : const Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: "Location 2",
                      color: !isHome
                          ? const Color(0xff623903)
                          : const Color(0xff868FAE),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    !isHome ? const Icon(Icons.check) : const Text(""),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              OutlinedContainer(
                padding: const EdgeInsets.all(10),
                borderRadius: 20,
                onTap: () {
                  Navigator.pushNamed(context, Routes.locations);
                },
                child: Image.asset("assets/images/pen_icon.png"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
