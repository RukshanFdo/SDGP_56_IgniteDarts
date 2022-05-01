import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/view_recipe.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';

class FoodOnlyCard extends StatefulWidget {
  const FoodOnlyCard({Key? key}) : super(key: key);

  @override
  _FoodOnlyCardState createState() => _FoodOnlyCardState();
}

class _FoodOnlyCardState extends State<FoodOnlyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.white,
        elevation: 0,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 2.5.h, 0, 1.h),
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
