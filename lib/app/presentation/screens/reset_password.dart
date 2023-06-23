import 'package:aquayar/app/bloc/auth/auth_bloc.dart';
import 'package:aquayar/app/bloc/auth/auth_event.dart';
import 'package:aquayar/app/bloc/auth/auth_state.dart';
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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  bool? emailState = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = context.watch<AuthBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(212, 33, 37, 80),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: TextWidget(
              text: "Reset Password",
              color: AppColors.titleBlack,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, right: 30),
            child: TextWidget(
              text:
                  "Enter the email associated with your account and we’ll send an OTP code to the phone number associated with this email.",
              color: AppColors.darkTitleGrey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
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
                      final emailState = Validator.validateEmail(
                          formfieldkey_1.currentState?.value);
                      return emailState;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                logger.e(state);
                if (state is AuthStatePasswordResetRequestSent) {
                  Navigator.pushReplacementNamed(context, Routes.emailSent,
                      arguments: formfieldkey_1.currentState?.value);
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
                        enabled: emailState!,
                        paddingVertical: 12,
                        label: TextWidget(
                          text: "  Send Instruction",
                          color: emailState!
                              ? AppColors.white
                              : AppColors.inputBorder,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        onPressed: () {
                          final formIsValid = formKey.currentState?.validate();
                          if (formIsValid!) {
                            bloc.add(AuthEventForgotPassword(
                                email: formfieldkey_1.currentState?.value));
                          }
                        });
              },
            ),
          )
        ],
      ),
    );
  }
}
