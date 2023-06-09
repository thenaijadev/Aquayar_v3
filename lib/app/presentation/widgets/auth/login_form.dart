import 'package:aquayar/app/presentation/widgets/auth/apple_auth_btn.dart';
import 'package:aquayar/app/presentation/widgets/auth/oauth_btn.dart';
import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/text_input.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  bool? emailState = false;
  bool? passwordState = false;
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Center(
            child: TextWidget(
              text: "Aquayar 👋🏿",
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Center(
            child: TextWidget(
              text: "Water without limits",
              color: AppColors.textGrey,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: InputFieldWidget(
              textFieldkey: formfieldkey_1,
              label: "Your email address",
              hintText: "e.g:mark@gmail.com",
              onChanged: (val) {
                setState(() {
                  emailState = formfieldkey_1.currentState?.validate();
                });
              },
              validator: (val) {
                final emailState =
                    Validator.validateEmail(formfieldkey_1.currentState?.value);
                return emailState;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: InputFieldWidget(
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
          BlueBtn(
              enabled: emailState! && passwordState!,
              paddingVertical: 12,
              label: TextWidget(
                text: "      Continue",
                color: enabled ? AppColors.white : AppColors.inputBorder,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/images/line.png",
                  width: 150,
                ),
              ),
              const TextWidget(
                text: "   or   ",
                color: AppColors.titleBlack,
              ),
              Flexible(
                child: Image.asset(
                  "assets/images/line.png",
                  width: 150,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, bottom: 20),
            child: OutlinedButtonWidget(
              image: Image.asset("assets/images/google.png"),
              label: "Log in with Google",
              onPressed: () {
                debugPrint("Google");
              },
            ),
          ),
          SignUpWithApple(
            onPressed: () {
              debugPrint("Apple");
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: TextWidget(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  text: "Dont have an account?",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              OutlinedButtonWidgetNoIcon(
                  width: 80,
                  height: 40,
                  label: "Sign up",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.registration);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
