import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/text_input.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/helper_functions.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();

  bool? emailState = false;
  bool enabled = false;
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  bool? phoneNumberHasError = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  text: "Phone Verification, ",
                  color: AppColors.titleBlack,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: TextWidget(
                  text:
                      "We need to do this be make sure we can reach you through this number. Make sure it's correct.",
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
                        initialValue: "+234-812-309-4065",
                        suffixIcon:
                            Image.asset("assets/images/check_circle.png"),
                        prefixicon: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    changeCountry(context, (Country country) {
                                      setState(() {
                                        countryFlag = country.flagEmoji;
                                      });
                                    });
                                  },
                                  child: TextWidget(
                                    text: countryFlag!,
                                    fontSize: 20,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset("assets/images/line_vert.png"),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        obscureText: obscureText,
                        textFieldkey: formfieldkey_3,
                        label: "Phone number",
                        hintText: "",
                        hintSize: 20,
                        onChanged: (val) {
                          setState(() {
                            phoneNumberHasError =
                                formfieldkey_3.currentState?.validate();
                          });
                        },
                        validator: (val) {
                          if (formfieldkey_3.currentState?.value.length != 17) {
                            return "Please enter a valid phone number";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: BlueBtn(
                enabled: phoneNumberHasError!,
                paddingVertical: 12,
                label: TextWidget(
                  text: "              Verify",
                  color: phoneNumberHasError!
                      ? AppColors.white
                      : AppColors.inputBorder,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                onPressed: () {
                  final formIsValid = formKey.currentState?.validate();
                  if (formIsValid!) {
                    Navigator.pushNamed(context, Routes.otp);
                  }
                }),
          )
        ],
      ),
    );
  }
}
