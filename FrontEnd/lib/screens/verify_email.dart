import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/dashboard.dart';
import 'package:food_recpie_app/screens/sign_in.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:food_recpie_app/widgets/auth_error_alert.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> with WidgetsBindingObserver {
  bool isEmailVerified = false;
  Timer? timer;
  bool canResendEmail = false;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } on Exception catch (e) {
      showAuthErrorAlert(context, e.toString());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    timer?.cancel();
    log('Log: VerifyEmail -  Acc verification cancelled');
    FirebaseAuth.instance.signOut();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const Dashboard()
      : WillPopScope(
          onWillPop: () async {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const SignIn(),
                ),
                (route) => false);
            return Future.value(true);
          },
          child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Check your email',
                            style: TextStyle(
                              color: mainText,
                              fontSize: 22,
                              fontFamily: 'InterBold',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'We’ve sent the code to your email',
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 15,
                              fontFamily: 'InterMedium',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      //   child: Row(
                      //     children: const [
                      //       Expanded(
                      //         child: TextField(
                      //           keyboardType: TextInputType.number,
                      //           cursorColor: primaryColor,
                      //           textAlign: TextAlign.center,
                      //           decoration: InputDecoration(
                      //             focusedBorder: OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(20.0)),
                      //               borderSide: BorderSide(
                      //                   color: primaryColor, width: 2.0),
                      //             ),
                      //             enabledBorder: OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(20.0)),
                      //               borderSide: BorderSide(
                      //                   color: outlineText, width: 2.0),
                      //             ),
                      //           ),
                      //           style: TextStyle(
                      //             color: mainText,
                      //             fontSize: 30,
                      //             fontFamily: 'InterBold',
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         child: TextField(
                      //           keyboardType: TextInputType.number,
                      //           cursorColor: primaryColor,
                      //           textAlign: TextAlign.center,
                      //           decoration: InputDecoration(
                      //             focusedBorder: OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(20.0)),
                      //               borderSide: BorderSide(
                      //                   color: primaryColor, width: 2.0),
                      //             ),
                      //             enabledBorder: OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(20.0)),
                      //               borderSide: BorderSide(
                      //                   color: outlineText, width: 2.0),
                      //             ),
                      //           ),
                      //           style: TextStyle(
                      //             color: mainText,
                      //             fontSize: 30,
                      //             fontFamily: 'InterBold',
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         child: TextField(
                      //           keyboardType: TextInputType.number,
                      //           cursorColor: primaryColor,
                      //           textAlign: TextAlign.center,
                      //           decoration: InputDecoration(
                      //             focusedBorder: OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(20.0)),
                      //               borderSide: BorderSide(
                      //                   color: primaryColor, width: 2.0),
                      //             ),
                      //             enabledBorder: OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(20.0)),
                      //               borderSide: BorderSide(
                      //                   color: outlineText, width: 2.0),
                      //             ),
                      //           ),
                      //           style: TextStyle(
                      //             color: mainText,
                      //             fontSize: 30,
                      //             fontFamily: 'InterBold',
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         child: TextField(
                      //           keyboardType: TextInputType.number,
                      //           cursorColor: primaryColor,
                      //           textAlign: TextAlign.center,
                      //           decoration: InputDecoration(
                      //             focusedBorder: OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(20.0)),
                      //               borderSide: BorderSide(
                      //                   color: primaryColor, width: 2.0),
                      //             ),
                      //             enabledBorder: OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(20.0)),
                      //               borderSide: BorderSide(
                      //                   color: outlineText, width: 2.0),
                      //             ),
                      //           ),
                      //           style: TextStyle(
                      //             color: mainText,
                      //             fontSize: 30,
                      //             fontFamily: 'InterBold',
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 60,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: const [
                      //     Text(
                      //       'code expires in: ',
                      //       style: TextStyle(
                      //         color: mainText,
                      //         fontSize: 15,
                      //         fontFamily: 'InterMedium',
                      //       ),
                      //     ),
                      //     Text(
                      //       '03:12',
                      //       style: TextStyle(
                      //         color: secondaryColor,
                      //         fontSize: 15,
                      //         fontFamily: 'InterMedium',
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   margin: const EdgeInsets.only(left: 20, right: 20),
                      //   child: TextButton(
                      //     onPressed: () {},
                      //     style: ButtonStyle(
                      //       padding: MaterialStateProperty.all<EdgeInsets>(
                      //         const EdgeInsets.all(20),
                      //       ),
                      //       shape: MaterialStateProperty.all<
                      //               RoundedRectangleBorder>(
                      //           RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(30.0))),
                      //       backgroundColor:
                      //           MaterialStateProperty.all(primaryColor),
                      //     ),
                      //     child: const Text(
                      //       'Verify',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 15,
                      //         fontFamily: 'InterBold',
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      canResendEmail
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextButton(
                                onPressed: sendVerificationEmail,
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(20),
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: outlineText,
                                              width: 2,
                                              style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                ),
                                child: const Text(
                                  'Send again',
                                  style: TextStyle(
                                    color: secondaryText,
                                    fontSize: 15,
                                    fontFamily: 'InterBold',
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                            )
                    ],
                  ),
                )),
          ),
        );
}
