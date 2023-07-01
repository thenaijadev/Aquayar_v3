import 'package:aquayar/app/presentation/widgets/customer_flow/location_suggestion_widget.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class EditLocation extends StatefulWidget {
  const EditLocation({super.key});

  @override
  State<EditLocation> createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget(
          text: "Your Locations",
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.titleBlack,
            size: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              left: 18,
              right: 18,
            ),
            child: OutlinedContainer(
              borderRadius: 22,
              padding: const EdgeInsets.only(
                  left: 24, bottom: 16, top: 16, right: 21),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/left_arrow.png"),
                        Row(
                          children: [
                            SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    Image.asset("assets/images/pen_icon.png")),
                            const SizedBox(width: 5),
                            const TextWidget(
                              text: "Editing Home",
                              fontSize: 16,
                              color: Color(0xff868FAE),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: AppColors.inputBorder,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Transform.translate(
                          offset: const Offset(0, -3),
                          child: TextFormField(
                            cursorColor: AppColors.inputBorder,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                suffix: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Transform.translate(
                                    offset: const Offset(0, 3),
                                    child: Transform.scale(
                                        scale: 1.3,
                                        child: Image.asset(
                                            "assets/images/x_circle.png")),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const LocationSuggestionWidget()
        ],
      ),
    );
  }
}
