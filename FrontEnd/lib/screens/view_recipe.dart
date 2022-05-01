import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class ViewRecipe extends StatefulWidget {
  const ViewRecipe({Key? key}) : super(key: key);

  @override
  _ViewRecipeState createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/f2.jpg'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter),
            ),
          ),
          Positioned(
            left: 25.0,
            top: 60.0,
            child: Center(
                child: buildBlur(
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: formText.withOpacity(0.3),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            padding: const EdgeInsets.only(right: 2),
                            child: const ImageIcon(
                              AssetImage('assets/icons/back.png'),
                              color: Colors.white,
                            ),
                          )),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ))),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.66,
              minChildSize: 0.66,
              builder: (context, controller) => ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          controller: controller,
                          padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Container(
                                  width: 60.0,
                                  height: 7.0,
                                  margin: const EdgeInsets.only(bottom: 30.0),
                                  decoration: const BoxDecoration(
                                    color: outlineText,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child:
                                      const Padding(padding: EdgeInsets.all(5)),
                                ),
                              ),
                              const Text(
                                'Cacao Maca Walnut Milk',
                                style: TextStyle(
                                  fontFamily: 'InterBold',
                                  fontSize: 17,
                                  color: mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                'Food • 60 mins',
                                style: TextStyle(
                                  fontFamily: 'InterMedium',
                                  fontSize: 15,
                                  color: secondaryText,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/p1.jpg'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Text(
                                    'Elena Shelby',
                                    style: TextStyle(
                                      fontFamily: 'InterBold',
                                      fontSize: 15,
                                      color: mainText,
                                    ),
                                  ),
                                  const Expanded(
                                      child: SizedBox(
                                    width: double.infinity,
                                  )),
                                  Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryColor),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(9, 11, 9, 9),
                                        child: ImageIcon(
                                          AssetImage(
                                              'assets/icons/heart_round.png'),
                                          color: Color(0xBFFFFFFF),
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Text(
                                    '273 Likes',
                                    style: TextStyle(
                                      fontFamily: 'InterBold',
                                      fontSize: 15,
                                      color: mainText,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Divider(
                                thickness: 1,
                                color: outlineText,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  fontFamily: 'InterBold',
                                  fontSize: 17,
                                  color: mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                                style: TextStyle(
                                    fontFamily: 'InterMedium',
                                    fontSize: 15,
                                    color: secondaryText,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Divider(
                                thickness: 1,
                                color: outlineText,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                'Ingredients',
                                style: TextStyle(
                                  fontFamily: 'InterBold',
                                  fontSize: 17,
                                  color: mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
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
                                              AssetImage(
                                                  'assets/icons/check.png'),
                                              color: primaryColor,
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      const Text(
                                        '4 Eggs',
                                        style: TextStyle(
                                          fontFamily: 'InterMedium',
                                          fontSize: 15,
                                          color: mainText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
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
                                              AssetImage(
                                                  'assets/icons/check.png'),
                                              color: primaryColor,
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      const Text(
                                        '1/2 Butter',
                                        style: TextStyle(
                                          fontFamily: 'InterMedium',
                                          fontSize: 15,
                                          color: mainText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
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
                                              AssetImage(
                                                  'assets/icons/check.png'),
                                              color: primaryColor,
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      const Text(
                                        '1/2 Butter',
                                        style: TextStyle(
                                          fontFamily: 'InterMedium',
                                          fontSize: 15,
                                          color: mainText,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Divider(
                                thickness: 1,
                                color: outlineText,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              const Text(
                                'Steps',
                                style: TextStyle(
                                  fontFamily: 'InterBold',
                                  fontSize: 17,
                                  color: mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: mainText),
                                      child: const Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Center(
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                fontFamily:
                                                    'assets/fonts/InterBold',
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ))),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  const Text(
                                    'Your recipe has been uploaded, you\ncan see it on your profile. Your recipe\nhas been uploaded, you can see it on\nyour',
                                    style: TextStyle(
                                      fontFamily: 'InterMedium',
                                      fontSize: 15,
                                      color: mainText,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(40, 15, 0, 15),
                                width: double.maxFinite,
                                height: 220,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/veg.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ))
        ],
      ),
    );
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
