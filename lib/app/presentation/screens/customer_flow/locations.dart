import 'package:aquayar/app/data/models/address.dart';
import 'package:aquayar/app/data/models/boxes.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/add_location_form.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/locations.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
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
      body: Stack(children: [
        ValueListenableBuilder(
            valueListenable: Boxes.getAddresses().listenable(),
            builder: (context, box, _) {
              final addresses = box.values.toList().cast<Address>();
              return addresses.isEmpty
                  ? const AddLocationForm()
                  : Locations(
                      addresses: addresses,
                    );
            }),
      ]),
    );
  }
}
