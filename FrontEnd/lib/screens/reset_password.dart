import 'package:flutter/material.dart';
import 'package:food_recpie_app/utils/colors.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
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
                      'Reset your password',
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
                      'Please enter your new password',
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
                  child: const TextField(
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                        color: mainText,
                        fontFamily: 'InterMedium',
                        fontSize: 15),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(color: primaryColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(color: outlineText, width: 2.0),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: mainText,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(left: 15, right: 20),
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: secondaryText,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: secondaryText,
                        fontFamily: 'InterMedium',
                      ),
                      border: InputBorder.none,
                    ),
                    cursorColor: primaryColor,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
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
                Row(
                  children: <Widget>[
                    Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFE3FFF8)),
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
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
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
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    child: const Text(
                      'Done',
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
    );
  }
}
