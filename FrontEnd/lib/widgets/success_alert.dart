import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/dashboard.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';

showAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext c) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 59.h,
            padding: EdgeInsets.all(3.h),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  width: 35.w,
                  height: 35.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/emoji.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.5.h),
                  child: Text(
                    'Upload Success',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InterBold',
                      fontSize: 17.sp,
                      color: mainText,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                  child: Text(
                    'Your recipe has been uploaded,\nyou can see it on your profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InterMedium',
                      fontSize: 11.sp,
                      color: mainText,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => const Dashboard(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(13.w, 2.h, 13.w, 2.h)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontFamily: 'InterBold',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
