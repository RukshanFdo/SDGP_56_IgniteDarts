import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/profile.dart';
import 'package:food_recpie_app/screens/view_recipe.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';

class FoodItemCard extends StatefulWidget {
  const FoodItemCard({Key? key}) : super(key: key);

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(5.w, 3.h, 5.w, 0),
        color: Colors.white,
        elevation: 0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                  height: 7.h,
                  width: 7.h,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/p1.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                InkWell(
                  child: Text(
                    'Senith',
                    style: TextStyle(
                      color: mainText,
                      fontSize: 11.sp,
                      fontFamily: 'InterMedium',
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                )
              ],
            ),
            Stack(
              children: <Widget>[
                InkWell(
                    child: Container(
                      // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      margin: EdgeInsets.fromLTRB(0, 2.5.h, 0, 1.h),
                      //width: double.maxFinite,
                      width: 20.3.h,
                      height: 20.3.h,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/f2.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewRecipe(),
                        ),
                      );
                    }),
                Positioned(
                  right: 3.w,
                  bottom: 15.h,
                  child: Center(
                      child: buildBlur(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                        color: formText.withOpacity(0.3),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const ImageIcon(
                        AssetImage('assets/icons/heart.png'),
                        color: Colors.white,
                      ),
                    ),
                  )),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pancake',
                style: TextStyle(
                  color: mainText,
                  fontSize: 13.sp,
                  fontFamily: 'InterBold',
                ),
              ),
            ),
            Container(
              // margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              margin: EdgeInsets.fromLTRB(0, 1.5.h, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Food • >60 mins',
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 11.sp,
                    fontFamily: 'InterMedium',
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget buildBlur({
    required Widget child,
    required BorderRadius borderRadius,
    double sigmaX = 10,
    double sigmaY = 10,
  }) =>
      ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );
}
