import 'package:aquayar/app/presentation/widgets/customer_flow/horizontal_divider.dart';
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: "WTC Estate",
                fontSize: 20,
                color: AppColors.titleBlack,
                textAlign: TextAlign.left,
              ),
              const TextWidget(
                  text: "Odoeze St, Enugu,Nigeria", color: Color(0xff868FAE)),
              const SizedBox(
                height: 20,
              ),
              HorizontalDivider(width: MediaQuery.of(context).size.width * 0.81)
            ],
          )
        ],
      ),
    );
  }
}
