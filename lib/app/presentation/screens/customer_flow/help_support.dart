import 'package:aquayar/app/presentation/screens/customer_flow/menu.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/text_input.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:aquayar/utilities/snackbar.dart';
import 'package:aquayar/utilities/validators.dart';
import 'package:flutter/material.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget(
          text: "Help & Support",
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
            ),
            child: InputFieldWidget(
              verticalContentPadding: 0,
              hintSize: 14,
              prefixicon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset("assets/images/search_icon.png"),
              ),
              onTap: () {
                InfoSnackBar.showTicketSnackBar(
                    context, "Tickets", 'View tickets or open a new ticket');
              },
              textFieldkey: formfieldkey_1,
              label: "Search for a question",
              hintColor: const Color(0xFF868FAD),
              hintText: "Start typing...",
              onChanged: (val) {},
              validator: (val) {
                final emailState = Validator.validateText(
                    formfieldkey_1.currentState?.value, "Display name");
                return emailState;
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 28, bottom: 20),
            child: TextWidget(
              text: "Get Help",
              fontWeight: FontWeight.bold,
            ),
          ),
          HelpTile(
            onTap: () {},
            label: 'Getting started with Aquayar',
          ),
          HelpTile(
            onTap: () {},
            label: 'Payment and data',
          ),
          HelpTile(
            onTap: () {},
            label: 'Payment and pricing',
          ),
          HelpTile(
            onTap: () {},
            label: 'App and features',
          ),
          HelpTile(
            onTap: () {},
            label: 'How to reset my password',
          ),
          HelpTile(
            onTap: () {},
            label: 'Get Started',
          ),
        ],
      ),
    );
  }
}

class HelpTile extends StatelessWidget {
  const HelpTile({super.key, required this.onTap, required this.label});
  final void Function() onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5, bottom: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: label,
                  fontSize: 18,
                ),
                Image.asset("assets/images/chevron_right.png"),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const HorizontalRuleWidget()
        ],
      ),
    );
  }
}
