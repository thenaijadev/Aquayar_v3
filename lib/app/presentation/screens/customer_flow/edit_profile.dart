import 'package:aquayar/app/presentation/widgets/onboarding_flow/radio_btn.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/text_input.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/enums.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  bool? emailState = false;

  final GlobalKey<FormFieldState> textFieldkey = GlobalKey<FormFieldState>();
  bool? nameHasError = false;

  bool? genderSelected = false;
  String? choice;
  bool? genderChosen = false;
  bool showError = false;
  String? token;
  bool keyboardUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: const TextWidget(
            text: "Edit Profile",
            color: Color(0xFF20254F),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/images/arrow_left.png",
              width: 24,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
              key: formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .85,
                child: Column(
                  mainAxisAlignment: !keyboardUp
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 45.0,
                              ),
                              child: InputFieldWidget(
                                onTap: () {
                                  setState(() {
                                    keyboardUp = true;
                                  });
                                },
                                textFieldkey: formfieldkey_1,
                                label: "Your display name",
                                hintText: "Daze",
                                onChanged: (val) {
                                  setState(() {
                                    emailState =
                                        formfieldkey_1.currentState?.validate();
                                  });
                                },
                                validator: (val) {
                                  final emailState = Validator.validateText(
                                      formfieldkey_1.currentState?.value,
                                      "Display name");
                                  return emailState;
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16, top: 20, bottom: 7),
                              child: TextWidget(
                                text: "Select gender",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                            const SizedBox(height: 42),
                          ],
                        ),
                      ],
                    ),
                    emailState!
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GestureDetector(
                              onTap: () async {
                                // final formIsValid =
                                //     formKey.currentState?.validate();
                                // if (formIsValid!) {
                                //   authBloc.add(AuthEventChangePassword(
                                //       token: widget.token,
                                //       password:
                                //           formfieldkey_1.currentState?.value,
                                //       confirmPassword:
                                //           formfieldkey_2.currentState?.value));
                                // }
                              },
                              child: Image.asset("assets/images/save.png"),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child:
                                Image.asset("assets/images/continue_grey.png"),
                          )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
