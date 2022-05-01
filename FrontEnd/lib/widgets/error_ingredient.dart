import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/dashboard.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';

showAlertDialogError(BuildContext context, String errorMessageText) {
  return showDialog(
      context: context,
      builder: (BuildContext c) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            alignment: Alignment.center,
            width: 40.h,
            height: 35.h,
            padding: EdgeInsets.all(3.h),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 4.5.h),
                  child: Text(
                    'Sorry,',
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
                    '${errorMessageText}',
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
                    Navigator.pop(context);
                    // Navigator.pushAndRemoveUntil<dynamic>(
                    //   context,
                    //   MaterialPageRoute<dynamic>(
                    //     builder: (BuildContext context) => const Dashboard(),
                    //   ),
                    //   (route) => false,
                    // );
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
                    'Ok',
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
