import 'package:flutter/material.dart';

class InfoSnackBar {
  static SnackBar successSnackBar(String message) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.verified,
              color: Colors.lightGreen,
              size: 20,
            ),
            Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      elevation: 2,
    );
  }

  static SnackBar errorSnackBar(String message) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.white,
              size: 30,
            ),
            Flexible(
              child: Text(
                message,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      elevation: 2,
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(InfoSnackBar.errorSnackBar(message));
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(InfoSnackBar.successSnackBar(message));
  }
}
