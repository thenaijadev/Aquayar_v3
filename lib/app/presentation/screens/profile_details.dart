import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/text_input.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  bool? emailState = false;
  bool? passwordState = false;
  bool enabled = false;
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: "Hey, ",
                color: AppColors.titleBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const TextWidget(
                text: "Hey, Daniel👑",
                color: AppColors.titleBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: InputFieldWidget(
                    obscureText: obscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.titleBlack,
                      ),
                    ),
                    textFieldkey: formfieldkey_2,
                    label: "Choose a password",
                    hintText: "•••••••••",
                    hintSize: 20,
                    onChanged: (val) {
                      setState(() {
                        passwordState = formfieldkey_2.currentState?.validate();
                      });
                    },
                    validator: (val) {
                      final passwordStatus = Validator.validatePassword(
                          formfieldkey_2.currentState?.value);
                      return passwordStatus;
                    },
                  ),
                ),
              ),
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
                    // enabled: nameHasError!,
                    paddingVertical: 12,
                    label: const TextWidget(
                      text: "      Continue",
                      // color: nameHasError!
                      //     ? AppColors.white
                      //     : AppColors.inputBorder,
                      // fontWeight: FontWeight.bold,
                      // fontSize: 14,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.profileDetails);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
