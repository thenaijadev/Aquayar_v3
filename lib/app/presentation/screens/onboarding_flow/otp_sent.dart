import 'package:aquayar/app/bloc/auth/auth_bloc.dart';
import 'package:aquayar/app/bloc/auth/auth_event.dart';
import 'package:aquayar/app/bloc/auth/auth_state.dart';
import 'package:aquayar/app/bloc/user/user_state.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'dart:async';

class OtpSent extends StatefulWidget {
  const OtpSent({super.key, required this.data});
  final String data;
  @override
  State<OtpSent> createState() => _OtpSentState();
}

class _OtpSentState extends State<OtpSent> {
  String? otp;
  // Step 2
  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 2);

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();

    setState(() {
      myDuration = const Duration(minutes: 2);
      canResendCode = false;
    });
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        canResendCode = true;
        stopTimer();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  bool canResendCode = false;
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = context.watch<AuthBloc>();

    String strDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = strDigits(myDuration.inMinutes);
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextWidget(
                  text: "You’re almost done",
                  color: AppColors.titleBlack,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: TextWidget(
                  text:
                      "A code has been successfully sent to your mobile number. Enter the code to proceed.",
                  color: AppColors.darkTitleGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 30, right: 30),
                child: OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 70,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldStyle: FieldStyle.underline,
                  onChanged: (val) {
                    otp = val;
                    debugPrint(val);
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/clock.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: "$minutes:${seconds}s",
                          color: const Color(0xffF79009),
                        ),
                        const TextWidget(
                          text: "  waiting time",
                          color: Color(0xff868FAE),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.subdirectory_arrow_right_outlined,
                            color: canResendCode
                                ? AppColors.titleBlack
                                : AppColors.inputBorder),
                        TextButton(
                          onPressed: () {
                            if (canResendCode) {
                              resetTimer();
                              startTimer();

                              authBloc.add(AuthEventForgotPassword(
                                email: widget.data,
                              ));
                            }
                          },
                          child: TextWidget(
                              text: "Resend Code",
                              fontWeight: FontWeight.bold,
                              color: canResendCode
                                  ? AppColors.titleBlack
                                  : AppColors.inputBorder),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateError) {
                  InfoSnackBar.showErrorSnackBar(context, state.message);
                } else {
                  if (state is AuthStatePasswordChangeOtpSent) {
                    Navigator.pushNamed(context, Routes.createNewPassword,
                        arguments: state.resetToken);
                  }
                }
              },
              builder: (context, state) {
                return state is UserStateIsLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: SpinKitSpinningLines(
                          color: Color.fromARGB(255, 4, 136, 231),
                          size: 40.0,
                        ),
                      )
                    : otp?.length != 4
                        ? BlueBtn(
                            enabled: otp?.length == 4,
                            paddingVertical: 12,
                            label: TextWidget(
                              text: "              Verify",
                              color: otp?.length == 4
                                  ? AppColors.white
                                  : AppColors.inputBorder,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            onPressed: () {},
                          )
                        : GestureDetector(
                            onTap: () {
                              if (otp?.length == 4) {
                                authBloc.add(AuthEventCheckOtpForPasswordChange(
                                  otp: otp!,
                                ));
                              }
                            },
                            child:
                                Image.asset("assets/images/verify_blue.png"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
