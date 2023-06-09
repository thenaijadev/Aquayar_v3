import 'package:aquayar/app/presentation/widgets/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Column(
        children: [
          Column(
            children: [
              Center(
                  child: TextWidget(
                text: "What should we call you?",
                color: AppColors.titleBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))
            ],
          )
        ],
      ),
    );
  }
}
