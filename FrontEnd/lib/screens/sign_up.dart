import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recpie_app/screens/verify_email.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_error_alert.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordCrontroller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late bool _obscureText;
  String errorMessage = '';
  bool _isLoading = false;
  bool _hasSixChars = false;
  bool _hasNumber = false;

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
            child: Center(
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Welcome!',
                          style: TextStyle(
                              color: mainText,
                              fontSize: 22,
                              fontFamily: 'InterBold'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Please enter your account here',
                          style: TextStyle(
                              color: secondaryText,
                              fontSize: 15,
                              fontFamily: 'InterMedium'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
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
                        onChanged: (value) {
                          setState(() {
                            _hasNumber = false;
                          });
                          setState(() {
                            _hasSixChars = false;
                          });
                          if (value.length >= 6) {
                            setState(() {
                              _hasSixChars = true;
                            });
                          }
                          if (value.contains(RegExp(r'[0-9]'))) {
                            setState(() {
                              _hasNumber = true;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Your password must contain:',
                          style: TextStyle(
                              color: mainText,
                              fontSize: 17,
                              fontFamily: 'InterMedium'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _hasSixChars
                        ? Row(
                            children: <Widget>[
                              Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFE3FFF8)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: ImageIcon(
                                      AssetImage('assets/icons/check.png'),
                                      color: primaryColor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 15.0,
                              ),
                              const Text(
                                'Atleast 6 characters',
                                style: TextStyle(
                                  fontFamily: 'InterMedium',
                                  fontSize: 15,
                                  color: mainText,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: <Widget>[
                              Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: formText),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: ImageIcon(
                                      AssetImage('assets/icons/check.png'),
                                      color: secondaryText,
                                    ),
                                  )),
                              const SizedBox(
                                width: 15.0,
                              ),
                              const Text(
                                'Atleast 6 characters',
                                style: TextStyle(
                                  fontFamily: 'InterMedium',
                                  fontSize: 15,
                                  color: secondaryText,
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    _hasNumber
                        ? Row(
                            children: <Widget>[
                              Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFE3FFF8)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: ImageIcon(
                                      AssetImage('assets/icons/check.png'),
                                      color: primaryColor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 15.0,
                              ),
                              const Text(
                                'Contains a number',
                                style: TextStyle(
                                  fontFamily: 'InterMedium',
                                  fontSize: 15,
                                  color: mainText,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: <Widget>[
                              Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: formText),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: ImageIcon(
                                      AssetImage('assets/icons/check.png'),
                                      color: secondaryText,
                                    ),
                                  )),
                              const SizedBox(
                                width: 15.0,
                              ),
                              const Text(
                                'Contains a number',
                                style: TextStyle(
                                  fontFamily: 'InterMedium',
                                  fontSize: 15,
                                  color: secondaryText,
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: signUp,
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
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'InterBold',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future signUp() async {
    if (_key.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordCrontroller.text.trim())
            .then((_) {
          errorMessage = '';
          setState(() {
            _isLoading = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => const VerifyEmail(),
              ),
              (route) => false);
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
