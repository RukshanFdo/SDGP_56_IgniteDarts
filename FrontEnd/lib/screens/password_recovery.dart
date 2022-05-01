import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/sign_in.dart';
import 'package:food_recpie_app/utils/colors.dart';
import '../widgets/auth_error_alert.dart';
import '../widgets/forgot_password_alert.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final emailController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
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
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Form(
              key: _key,
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
                        'Password recovery',
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
                        'Enter your email to recovery your password',
                        style: TextStyle(
                            color: secondaryText,
                            fontSize: 15,
                            fontFamily: 'InterMedium'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
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
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: primaryColor, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: secondaryColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: outlineText, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: outlineText, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: resetPassword,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(20),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      child: const Text(
                        'Sign In',
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
      ]),
    );
  }

  Future resetPassword() async {
    if (_key.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim());

        errorMessage = '';
        setState(() {
          _isLoading = false;
        });

        ForgotPasswordSnackBar.showSnackBar();

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const SignIn(),
            ),
            (route) => false);
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
}
