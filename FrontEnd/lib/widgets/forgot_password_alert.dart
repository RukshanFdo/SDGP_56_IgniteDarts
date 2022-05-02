import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ForgotPasswordSnackBar {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static showSnackBar() {
    const snackBar = SnackBar(
        content: Text(
          'Password reset email has been sent.',
          style: TextStyle(color: Colors.white, fontFamily: 'InterMedium'),
        ),
        backgroundColor: secondaryColor);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
