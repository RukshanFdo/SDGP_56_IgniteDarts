import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/sign_in.dart';
import 'colors.dart';

class NotVerifiedAcc extends StatefulWidget {
  const NotVerifiedAcc({Key? key}) : super(key: key);

  @override
  _NotVerifiedAccState createState() => _NotVerifiedAccState();
}

class _NotVerifiedAccState extends State<NotVerifiedAcc> {
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          FirebaseAuth.instance.signOut();
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
                          'Not verified account',
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
                          "This account hasn't been verified",
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
                  ],
                ),
              )),
        ),
      );
}
