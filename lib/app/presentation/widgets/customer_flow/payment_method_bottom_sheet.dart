import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

void showPaymentMethodBottomSheet(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, right: 10),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset("assets/images/x.png")),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  text: "Payment Methods",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 50,
                ),
                const PaymentOption(
                  label: "Cash Payment",
                  visibility: false,
                  subTitle:
                      "You’ll make a bank transfer to a designated Aquayar account.",
                  subTitleColor: Color(0xFF868FAD),
                  labelColor: Color(0xFF20254F),
                  colors: [Color(0xFF60C6F9), Color(0xFF0479CD)],
                ),
                const SizedBox(
                  height: 16,
                ),
                const PaymentOption(
                  label: "Credit Card",
                  labelColor: Color(0xFFADAFC2),
                  subTitle:
                      "Use your vitual or physical cards to make payment or for your water bookings",
                  color: Color(0xFFFAFAFA),
                  subTitleColor: Color(0xFFADAFC2),
                  colors: [Colors.white, Colors.white],
                ),
                const SizedBox(
                  height: 16,
                ),
                const PaymentOption(
                  label: "Wallet",
                  subTitle:
                      'Fund your aquayar wallet and make withdrawals, and payments and enjoy huge discounts.',
                  subTitleColor: Color(0xFFADAFC2),
                  labelColor: Color(0xFFADAFC2),
                  color: Color(0xFFFAFAFA),
                  colors: [Colors.white, Colors.white],
                )
              ],
            ),
          ));
    },
  );
}

class PaymentOption extends StatelessWidget {
  const PaymentOption(
      {super.key,
      required this.colors,
      this.color,
      required this.labelColor,
      required this.subTitleColor,
      required this.label,
      required this.subTitle,
      this.visibility = true});
  final List<Color> colors;
  final Color? color;
  final Color labelColor;
  final Color subTitleColor;
  final String label;
  final String subTitle;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        OutlinedContainer(
          color: color,
          borderRadius: 30,
          child: Row(children: [
            OutlinedContainer(
              borderRadius: 100,
              padding: const EdgeInsets.all(6),
              child: Container(
                width: 18,
                height: 18,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.75, -0.67),
                    end: const Alignment(-0.75, 0.67),
                    colors: colors,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 21,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/money.png"),
                    const SizedBox(
                      width: 8,
                    ),
                    TextWidget(
                      text: label,
                      color: labelColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: 260,
                  child: Wrap(
                    children: [
                      TextWidget(
                        text: subTitle,
                        color: subTitleColor,
                        fontSize: 14,
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
        Visibility(
          visible: visibility,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x2D000000),
                    blurRadius: 18,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
                border: Border.all(color: AppColors.inputBorder),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              child: const Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: TextWidget(
                  text: "COMING SOON",
                  color: Color(0xFF868FAD),
                  fontSize: 12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
