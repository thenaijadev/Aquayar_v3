import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: width,
      height: 1,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ));
  }
}
