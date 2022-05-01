import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/dashboard.dart';
import 'package:food_recpie_app/screens/password_recovery.dart';
import 'package:food_recpie_app/screens/sign_up.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recpie_app/utils/google_sign_in_provider.dart';
import 'package:food_recpie_app/utils/not_verified_acc.dart';
import 'package:food_recpie_app/widgets/auth_error_alert.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordCrontroller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late bool _obscureText;
  String errorMessage = '';
  bool _isLoading = false;
  bool isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    _obscureText = false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordCrontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : Container(),
        Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 22,
                        color: mainText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please enter your account here',
                      style: TextStyle(
                        fontFamily: 'InterMedium',
                        fontSize: 15,
                        color: secondaryText,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: TextFormField(
                        controller: emailController,
                        validator: validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: const TextStyle(
                            color: mainText,
                            fontFamily: 'InterMedium',
                            fontSize: 15),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: secondaryColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: outlineText, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: outlineText, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: secondaryColor, width: 2.0),
                          ),
                          errorStyle: TextStyle(height: 0),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20, right: 15),
                            child: Icon(
                              Icons.email_outlined,
                              color: mainText,
                            ),
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: 'InterMedium',
                            color: secondaryText,
                          ),
                        ),
                        cursorColor: primaryColor,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.email],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: TextFormField(
                        validator: validatePassword,
                        obscureText: !_obscureText,
                        controller: passwordCrontroller,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                            color: mainText,
                            fontFamily: 'InterMedium',
                            fontSize: 15),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2.0),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: secondaryColor, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: outlineText, width: 2.0),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: outlineText, width: 2.0),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide:
                                BorderSide(color: secondaryColor, width: 2.0),
                          ),
                          errorStyle: const TextStyle(height: 0),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 20, right: 15),
                            child: Icon(
                              Icons.lock_outline_rounded,
                              color: mainText,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 0),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: FaIcon(
                                  _obscureText
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  color: secondaryText,
                                  size: 22,
                                )),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: secondaryText,
                            fontFamily: 'InterMedium',
                          ),
                        ),
                        cursorColor: primaryColor,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontFamily: 'InterMedium',
                              fontSize: 15,
                              color: mainText,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PasswordRecovery(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: signIn,
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'InterBold',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Text(
                      'Or continue with',
                      style: TextStyle(
                        fontFamily: 'InterMedium',
                        fontSize: 15,
                        color: secondaryText,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () async {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);

                            GoogleSignInProvider googleSignInProvider =
                                Provider.of<GoogleSignInProvider>(context,
                                    listen: false);

                            provider.googleLogin().then((_) async => {
                                  await googleSignInProvider.onStartUp(),
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            const Dashboard(),
                                      ),
                                      (route) => false)
                                });
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              SizedBox(
                                height: 17.0,
                                width: 17.0,
                                child: ImageIcon(
                                  AssetImage('assets/icons/google.png'),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'InterBold',
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Don’t have any account?',
                          style: TextStyle(
                            fontFamily: 'InterMedium',
                            fontSize: 15,
                            color: mainText,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'InterMedium',
                                fontSize: 15,
                                color: primaryColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }

  Future signIn() async {
    if (_key.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          log('Log: Sign in - User is not null');
          FirebaseAuth.instance.signOut();
        }

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordCrontroller.text.trim())
            .then((_) async {
          isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

          errorMessage = '';
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }

          if (isEmailVerified) {
            log('Log: SignIn -  Acc has been verified');
            log('Log: SignIn -  User sign in');

            GoogleSignInProvider googleSignInProvider =
                Provider.of<GoogleSignInProvider>(context, listen: false);

            await googleSignInProvider.onStartUp();

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const Dashboard(),
                ),
                (route) => false);
          } else {
            log('Log: SignIn -  Acc has not been verified');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const NotVerifiedAcc(),
                ),
                (route) => false);
          }
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });
        showAuthErrorAlert(context, e.message);
      }
    }
  }

  String? validateEmail(String? formEmail) {
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);

    if (formEmail == null || formEmail.isEmpty || !regex.hasMatch(formEmail)) {
      return '';
    }

    return null;
  }

  String? validatePassword(String? formPassword) {
    String pattern = r'^(?=.*?[0-9]).{6,}$';
    RegExp regex = RegExp(pattern);
    if (formPassword == null ||
        formPassword.isEmpty ||
        !regex.hasMatch(formPassword)) {
      return '';
    }
    return null;
  }
}
