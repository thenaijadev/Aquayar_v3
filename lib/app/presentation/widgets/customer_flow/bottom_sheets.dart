import 'package:aquayar/app/presentation/screens/customer_flow/order_water.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/location_suggestion_widget.dart';
import 'package:flutter/material.dart';

void showBottomSheetWidget(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.rotate(
                    angle: 45 * 0.0174533, // 90 degrees in radians
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.add,
                          weight: 1,
                          size: 35,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const AddressForm(),
              const SizedBox(
                height: 20,
              ),
              const LocationSuggestionWidget()
            ],
          ));
    },
  );
}
