import 'package:aquayar/app/presentation/screens/customer_flow/delete_account.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class LocationSuggestionWidget extends StatelessWidget {
  const LocationSuggestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 25),
      child: Row(
        children: [
          Column(
            children: [
              Center(child: Image.asset("assets/images/location_pin.png")),
              const SizedBox(
                height: 20,
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "WTC Estate",
                fontSize: 18,
                color: AppColors.titleBlack,
                textAlign: TextAlign.left,
              ),
              TextWidget(
                text: "Odoeze St, Enugu,Nigeria",
                color: Color(0xff868FAE),
                fontSize: 16,
              ),
              SizedBox(
                height: 18,
              ),
              HorizontalLineWidget(
                width: 320,
              )
            ],
          )
        ],
      ),
    );
  }
}
