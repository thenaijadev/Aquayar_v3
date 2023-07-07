import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const TextWidget(
            text: "Delete Account",
            color: Color(0xFF20254F),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/images/arrow_left.png",
              width: 24,
            ),
          )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 42),
                  child: Center(
                    child: TextWidget(
                        color: Color(0xFF868FAD),
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        text:
                            "Please keep in mind that this action cannot be undone, and we won't be able to retrieve any of your data once it's deleted."),
                  ),
                ),
                DeleteCheckItems(),
                DeleteCheckItems(),
                DeleteCheckItems(),
                DeleteCheckItems(),
                DeleteCheckItems(),
                DeleteCheckItems(),
                DeleteCheckItems(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset("assets/images/delete_btn.png"),
            )
          ],
        ),
      ),
    );
  }
}

class DeleteCheckItems extends StatefulWidget {
  const DeleteCheckItems({super.key});

  @override
  State<DeleteCheckItems> createState() => _DeleteCheckItemsState();
}

bool? isChecked = false;

class _DeleteCheckItemsState extends State<DeleteCheckItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                      side: const BorderSide(width: 1, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      value: isChecked,
                      onChanged: (val) {
                        setState(() {
                          isChecked = val;
                        });
                      }),
                  const TextWidget(text: "Lorem"),
                ],
              ),
              const HorizontalLineWidget()
            ],
          ),
        ),
      ],
    );
  }
}

class HorizontalLineWidget extends StatelessWidget {
  const HorizontalLineWidget({super.key, this.width = 396});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1,
      decoration: const BoxDecoration(color: Color(0xFFD6E0E9)),
    );
  }
}
