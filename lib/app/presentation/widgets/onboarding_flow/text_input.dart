import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {super.key,
      required this.label,
      this.initialValue,
      required this.hintText,
      this.hintSize = 14,
      required this.onChanged,
      this.validator,
      required this.textFieldkey,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixicon,
      this.padding = const EdgeInsets.only(bottom: 10),
      this.onTap});
  final String label;
  final String hintText;
  final double hintSize;
  final void Function(String?) onChanged;
  final void Function()? onTap;

  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState> textFieldkey;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final String? initialValue;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: padding,
            child: TextWidget(
              text: label,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          TextFormField(
            onTap: onTap,
            key: textFieldkey,
            initialValue: initialValue,
            onChanged: onChanged,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: prefixicon,
              suffixIcon: suffixIcon,
              hintStyle:
                  TextStyle(color: AppColors.hintColor, fontSize: hintSize),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.textGrey,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.inputBorder, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: hintText,
            ),
          ),
        ]),
      ),
    );
  }
}
