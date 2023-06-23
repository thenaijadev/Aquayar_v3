import 'package:aquayar/app/bloc/auth/auth_bloc.dart';
import 'package:aquayar/app/bloc/auth/auth_event.dart';
import 'package:aquayar/app/bloc/auth/auth_state.dart';
import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/radio_btn.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/enums.dart';
import 'package:aquayar/utilities/snackbar.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key, required this.data});
  final AuthUser data;
  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final GlobalKey<FormFieldState> textFieldkey = GlobalKey<FormFieldState>();
  bool? nameHasError = false;
  final formKey = GlobalKey<FormState>();
  bool? genderSelected = false;
  String? choice;
  bool? genderChosen = false;
  bool showError = false;
  String? token;
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = context.watch<AuthBloc>();
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
                key: formKey,
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
                    style: const TextStyle(fontSize: 40),
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
              Padding(
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
                            genderChosen = true;
                            showError = false;
                          });
                        }),
                    RadioBtn(
                        choice: choice,
                        label: Gender.Female.name.toString(),
                        onPressed: () {
                          setState(() {
                            choice = Gender.Female.name;
                            genderChosen = true;
                            showError = false;
                          });
                        }),
                    RadioBtn(
                        choice: choice,
                        label: "Choose not to say",
                        onPressed: () {
                          setState(() {
                            choice = "Choose not to say";
                            genderChosen = true;
                            showError = false;
                          });
                        })
                  ],
                ),
              ),
              Visibility(
                visible: showError,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/hazard.png"),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextWidget(
                          color: Color(0xffC0362C),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          text: "Let's know you better please? Select a gender",
                        ),
                      )
                    ],
                  ),
                ),
              )
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
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthStateUserNameAndGenderUpdated) {
                      Navigator.pushNamed(context, Routes.profileDetails,
                          arguments: {
                            "name": textFieldkey.currentState?.value,
                            "token": widget.data.authToken
                          });
                    } else if (state is AuthStateError) {
                      InfoSnackBar.showErrorSnackBar(context, state.message);
                    } else if (state is AuthStateRegistered) {
                      token = state.user.authToken;
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
                            enabled: nameHasError! && genderChosen!,
                            paddingVertical: 12,
                            label: TextWidget(
                              text: "      Continue",
                              color: nameHasError! || genderChosen == false
                                  ? AppColors.white
                                  : AppColors.inputBorder,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            onPressed: () async {
                              final formState =
                                  formKey.currentState?.validate();
                              if (formState! && genderChosen!) {
                                authBloc.add(AuthEventUpdateGenderAndName(
                                    name: textFieldkey.currentState?.value,
                                    gender: choice!.toLowerCase(),
                                    token: widget.data.authToken!));
                              } else if (!genderChosen!) {
                                setState(() {
                                  showError = true;
                                });
                              }
                            });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
