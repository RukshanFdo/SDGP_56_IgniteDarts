import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/sign_in.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class StartCooking extends StatefulWidget {
  const StartCooking({Key? key}) : super(key: key);

  @override
  _StartCookingState createState() => _StartCookingState();
}

class _StartCookingState extends State<StartCooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 60.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cooking.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Start Cooking',
                  style: TextStyle(
                    fontFamily: 'InterBold',
                    fontSize: 15.sp,
                    color: mainText,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  "Let's join Our Community",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'InterMedium',
                    color: secondaryText,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  "to cook better food!",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'InterMedium',
                    color: secondaryText,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 5.w, left: 5.w),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => const SignIn(),
                          ),
                          (route) => false);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(0, 2.75.h, 0, 2.75.h),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontFamily: 'InterBold',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
