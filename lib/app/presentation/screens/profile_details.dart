import 'package:aquayar/app/presentation/widgets/blue_btn.dart';
import 'package:aquayar/app/presentation/widgets/text_input.dart';
import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
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
  bool? emailState = false;
  bool? passwordState = false;
  bool enabled = false;
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: InputFieldWidget(
                        obscureText: obscureText,
                        textFieldkey: formfieldkey_2,
                        label: "Your address",
                        hintText: "",
                        hintSize: 20,
                        onChanged: (val) {
                          setState(() {
                            passwordState =
                                formfieldkey_2.currentState?.validate();
                          });
                        },
                        validator: (val) {
                          final passwordStatus = Validator.validateAddress(
                              formfieldkey_2.currentState?.value, "This field");
                          return passwordStatus;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 25),
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
                                return 'Please Enter a valid State';
                              }
                              return null;
                            },
                            searchInputDecoration: InputDecoration(
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
                              debugPrint(value.searchKey);
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
                        textFieldkey: formfieldkey_1,
                        label: "Phone number",
                        hintText: "",
                        hintSize: 20,
                        onChanged: (val) {
                          setState(() {
                            passwordState =
                                formfieldkey_2.currentState?.validate();
                          });
                        },
                        validator: (val) {
                          final passwordStatus = Validator.validateAddress(
                              formfieldkey_2.currentState?.value, "This field");
                          return passwordStatus;
                        },
                      ),
                    ),
                    const TextWidget(text: "Choose your water tank size")
                  ],
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
                    onPressed: () {}),
              ),
            ],
          )
        ],
      ),
    );
  }
}

final List<String> nigerianStates = [
  'Abia',
  'Adamawa',
  'Akwa Ibom',
  'Anambra',
  'Bauchi',
  'Bayelsa',
  'Benue',
  'Borno',
  'Cross River',
  'Delta',
  'Ebonyi',
  'Edo',
  'Ekiti',
  'Enugu',
  'FCT (Federal Capital Territory)',
  'Gombe',
  'Imo',
  'Jigawa',
  'Kaduna',
  'Kano',
  'Katsina',
  'Kebbi',
  'Kogi',
  'Kwara',
  'Lagos',
  'Nasarawa',
  'Niger',
  'Ogun',
  'Ondo',
  'Osun',
  'Oyo',
  'Plateau',
  'Rivers',
  'Sokoto',
  'Taraba',
  'Yobe',
  'Zamfara',
];

void changeCountry(context, onSelect) {
  showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
        bottomSheetHeight: 500, // Optional. Country list modal height
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.inputBorder, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onSelect: onSelect);
}
