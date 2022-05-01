import 'package:flutter/material.dart';
import '../main.dart';
import '../utils/colors.dart';

showAuthErrorAlert(BuildContext context, String? text) {
  if (text == null) return;

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(color: mainText),
            ),
            content: Text(
              text,
              style: const TextStyle(color: secondaryText),
            ),
            contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                  onPressed: () {
                    navigatorKey.currentState!.pop();
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(color: primaryColor),
                  ))
            ],
          ));
}
