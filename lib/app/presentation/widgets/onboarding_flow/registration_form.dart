import 'package:aquayar/app/bloc/auth/auth_bloc.dart';
import 'package:aquayar/app/bloc/auth/auth_event.dart';
import 'package:aquayar/app/bloc/auth/auth_state.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/oauth_btn.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/text_input.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/apple_auth_btn.dart';
import 'package:aquayar/utilities/logger.dart';
import 'package:aquayar/utilities/snackbar.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterationForm extends ConsumerStatefulWidget {
  const RegisterationForm({super.key});

  @override
  ConsumerState<RegisterationForm> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends ConsumerState<RegisterationForm> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();

  bool? emailState = false;
  bool? passwordState = false;
  bool? confirmPasswordState = false;
  bool enabled = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            child: Image.asset("assets/images/logo.png"),
          ),
          // const Center(
          //   child: TextWidget(
          //     text: "Aquayar 👋🏿",
          //     fontSize: 30,
          //     fontWeight: FontWeight.w700,
          //   ),
          // ),
          // const Center(
          //   child: TextWidget(
          //     text: "Water without limits",
          //     color: AppColors.textGrey,
          //     fontSize: 16,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: InputFieldWidget(
              verticalContentPadding: 20,
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
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              logger.e(state);
              if (state is AuthStateRegistered) {
                logger.e({"reg": state.getUser.authToken});
                Navigator.pushNamed(context, Routes.gender,
                    arguments: state.getUser);
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
                          authBloc.add(AuthEventRegister(
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
          Padding(
            padding: const EdgeInsets.only(top: 35.0, bottom: 20),
            child: OutlinedButtonWidget(
              image: Image.asset("assets/images/google.png"),
              label: "Sign up with Google",
              onPressed: () async {
                authBloc.add(const AuthEventSignUpWithGoogle());
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
                  text: "Already have an account?",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              OutlinedButtonWidgetNoIcon(
                  width: 80,
                  height: 40,
                  label: "Login",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.login);
                  })
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                style: TextStyle(fontSize: 12), //apply style to all
                children: [
                  TextSpan(
                    text: 'By continuing , you agree to our',
                    style: TextStyle(color: AppColors.richText),
                  ),
                  TextSpan(
                    text: ' Terms of Use ',
                    style: TextStyle(color: Color(0xff61C7F9)),
                  ),
                  TextSpan(
                    text: 'and confirm that you have read our ',
                    style: TextStyle(color: AppColors.richText),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(color: Color(0xff0579CE)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
