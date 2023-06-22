import 'package:aquayar/app/bloc/auth/auth_bloc.dart';
import 'package:aquayar/app/bloc/auth/auth_event.dart';
import 'package:aquayar/app/bloc/auth/auth_state.dart';
import 'package:aquayar/app/presentation/widgets/auth/apple_auth_btn.dart';
import 'package:aquayar/app/presentation/widgets/auth/oauth_btn.dart';
import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/text_input.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/logger.dart';
import 'package:aquayar/utilities/snackbar.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
  bool obscureText = true;
  bool? checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = context.watch<AuthBloc>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 20),
            child: TextWidget(
              text: "Happy to see you again 👋🏿",
              fontSize: 25,
              fontWeight: FontWeight.w700,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.forgotPassword);
                },
                child: GradientText("Reset Password",
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                    colors: const [
                      Color(0xff61C7F9),
                      Color(0xff0579CE),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      side: const BorderSide(width: 1, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      value: checkBoxValue,
                      onChanged: (val) {
                        setState(() {
                          checkBoxValue = val;
                        });
                      }),
                  const TextWidget(
                    text: "Keep me logged in",
                    fontSize: 15,
                    color: Color(0xff868FAE),
                  )
                ],
              )
            ],
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              logger.e(state);
              if (state is AuthStateLoggedIn) {
                logger.e({"reg": state.user.authToken});
                Navigator.pushNamed(context, Routes.registrationDone,
                    arguments: state.user);
              } else if (state is AuthStateError) {
                InfoSnackBar.showErrorSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return state is AuthStateIsLoading
                  ? const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: SpinKitSpinningLines(
                        color: Color.fromARGB(255, 4, 136, 231),
                        size: 40.0,
                      ),
                    )
                  : BlueBtn(
                      enabled: emailState! && passwordState!,
                      paddingVertical: 12,
                      label: TextWidget(
                        text: "      Continue",
                        color:
                            enabled ? AppColors.white : AppColors.inputBorder,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      onPressed: () async {
                        final formState = formKey.currentState?.validate();

                        if (formState!) {
                          authBloc.add(AuthEventLogIn(
                              email: formfieldkey_1.currentState?.value,
                              password: formfieldkey_2.currentState?.value));
                        }
                      });
            },
          ),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0, bottom: 20),
              child: OutlinedButtonWidget(
                image: Image.asset("assets/images/google.png"),
                label: "Sign in with Google",
                onPressed: () async {
                  authBloc.add(const AuthEventSignInWithGoogle());
                },
              ),
            ),
          ),
          Center(
            child: SignUpWithApple(
              onPressed: () {
                debugPrint("Apple");
              },
            ),
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
