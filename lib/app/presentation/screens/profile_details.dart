import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/tanksize_radio_btns.dart';
import 'package:aquayar/app/presentation/widgets/text_input.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/constants.dart/nigerian_states.dart';
import 'package:aquayar/utilities/helper_functions.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  String city = "";
  late TextEditingController cityController;
  bool? emailState = false;
  bool? addressState = false;
  bool enabled = false;
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  bool? phoneNumberHasError = false;

  @override
  void initState() {
    cityController = TextEditingController();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextWidget(
                  text: "Hey, ",
                  color: AppColors.titleBlack,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextWidget(
                  text: "Hey, Daniel👑",
                  color: AppColors.titleBlack,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: TextWidget(
                  text: "Kindly complete your profile details to proceed.",
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
                      padding: const EdgeInsets.only(top: 20.0),
                      child: InputFieldWidget(
                        obscureText: obscureText,
                        textFieldkey: formfieldkey_1,
                        label: "Your address",
                        hintText: "",
                        hintSize: 20,
                        onChanged: (val) {
                          setState(() {
                            addressState =
                                formfieldkey_1.currentState?.validate();
                          });
                        },
                        validator: (val) {
                          final addressError = Validator.validateAddress(
                              formfieldkey_1.currentState?.value, "This field");
                          return addressError;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: TextWidget(
                              text: "Your current city",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          SearchField(
                            onSubmit: (value) {},
                            controller: cityController,
                            suggestions: nigerianStates
                                .map((e) => SearchFieldListItem(e))
                                .toList(),
                            suggestionState: Suggestion.expand,
                            textInputAction: TextInputAction.next,
                            hint: 'Select',
                            searchStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            validator: (x) {
                              if (!nigerianStates.contains(x) || x!.isEmpty) {
                                return 'Please Enter a valid city';
                              }
                              return null;
                            },
                            searchInputDecoration: InputDecoration(
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
                              suffixIcon: const Icon(
                                Icons.expand_more,
                                color: Color.fromARGB(183, 33, 37, 80),
                              ),
                              hintStyle: const TextStyle(
                                color: AppColors.hintColor,
                                fontSize: 15,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inputBorder, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inputBorder, width: 1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onSuggestionTap: (value) {
                              city = value.searchKey;
                            },
                            maxSuggestionsInViewPort: 6,
                            itemHeight: 50,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InputFieldWidget(
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
                            final formIsValid =
                                formKey.currentState?.validate();
                          });
                        },
                        validator: (val) {
                          final passwordStatus = Validator.validatePhoneNumber(
                            formfieldkey_3.currentState?.value,
                          );
                          return passwordStatus;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 30),
                child: TextWidget(
                  text: "Choose your water tank size",
                  color: AppColors.titleBlack,
                ),
              ),
              const TankSizeRadioBtns(),
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 17,
                      color: Color(0xff868FAE),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: "This is optional, and can be changed.",
                      color: Color(0xff868FAE),
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BlueBtn(
                    enabled: addressState! &&
                        city.isNotEmpty &&
                        phoneNumberHasError!,
                    paddingVertical: 12,
                    label: TextWidget(
                      text: "      Continue",
                      color: addressState! &&
                              city.isNotEmpty &&
                              phoneNumberHasError!
                          ? AppColors.white
                          : AppColors.inputBorder,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    onPressed: () {
                      final formIsValid = formKey.currentState?.validate();
                      if (formIsValid!) {
                        Navigator.pushNamed(context, Routes.phoneVerification);
                      }
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
