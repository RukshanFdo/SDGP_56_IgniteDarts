import 'dart:developer';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/add_ingredients_row.dart';
import '../widgets/slider.dart';
import '../widgets/success_alert.dart';

class AddIngredient extends StatefulWidget {
  final String foodName, description, time;
  final String? coverImage;

  const AddIngredient(
      {Key? key,
      required this.foodName,
      required this.description,
      required this.time,
      required this.coverImage})
      : super(key: key);

  @override
  _AddIngredientState createState() => _AddIngredientState();
}

class _AddIngredientState extends State<AddIngredient> {
  int _countI = 2;
  bool isAtMax = false;
  // int _countS = 1;
  String index = '<10';

  @override
  Widget build(BuildContext context) {
    List<Widget> _ingredients = List.generate(
        _countI,
        (int i) => AddIngredientsRow(
              currentValue: '',
              index: i,
            ));

    // List<Widget> _steps = List.generate(
    //     _countS,
    //     (int i) => AddStepsRow(
    //           count: _countS,
    //         ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(25, 60, 25, 15),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'InterBold',
                      fontSize: 17,
                      color: secondaryColor,
                    ),
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  width: double.infinity,
                )),
                const Text(
                  '1',
                  style: TextStyle(
                    fontFamily: 'InterBold',
                    fontSize: 17,
                    color: secondaryText,
                  ),
                ),
                const Text(
                  '/2',
                  style: TextStyle(
                    fontFamily: 'InterBold',
                    fontSize: 17,
                    color: mainText,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Text(
                            'Ingredients',
                            style: TextStyle(
                              fontFamily: 'InterBold',
                              fontSize: 17,
                              color: mainText,
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            width: double.infinity,
                          )),
                          Icon(
                            Icons.add,
                            color: mainText,
                          ),
                          Text(
                            ' Group',
                            style: TextStyle(
                              fontFamily: 'InterMedium',
                              fontSize: 17,
                              color: mainText,
                            ),
                          ),
                        ],
                      ),
                      ListView(
                        children: _ingredients,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                            onPressed:
                                isAtMax == true ? () {} : _addIngredientsRow,
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: outlineText,
                                          width: 2,
                                          style: BorderStyle.solid),
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(
                                  Icons.add,
                                  color: mainText,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  'Ingredient',
                                  style: TextStyle(
                                    color: mainText,
                                    fontSize: 15,
                                    fontFamily: 'InterMedium',
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                //   color: Colors.white,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       const Text(
                //         'Steps',
                //         style: TextStyle(
                //           fontFamily: 'InterBold',
                //           fontSize: 17,
                //           color: mainText,
                //         ),
                //       ),
                //       ListView(
                //         children: _steps,
                //         scrollDirection: Axis.vertical,
                //         physics: const NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //       ),
                //       SizedBox(
                //         width: MediaQuery.of(context).size.width,
                //         child: TextButton(
                //             onPressed: _addStepsRow,
                //             style: ButtonStyle(
                //               padding: MaterialStateProperty.all<EdgeInsets>(
                //                 const EdgeInsets.fromLTRB(0, 15, 0, 15),
                //               ),
                //               shape: MaterialStateProperty.all<
                //                       RoundedRectangleBorder>(
                //                   RoundedRectangleBorder(
                //                       side: const BorderSide(
                //                           color: outlineText,
                //                           width: 2,
                //                           style: BorderStyle.solid),
                //                       borderRadius:
                //                           BorderRadius.circular(30.0))),
                //               backgroundColor:
                //                   MaterialStateProperty.all(Colors.white),
                //             ),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: const <Widget>[
                //                 Icon(
                //                   Icons.add,
                //                   color: mainText,
                //                 ),
                //                 SizedBox(
                //                   width: 7,
                //                 ),
                //                 Text(
                //                   'Step',
                //                   style: TextStyle(
                //                     color: mainText,
                //                     fontSize: 15,
                //                     fontFamily: 'InterMedium',
                //                   ),
                //                 ),
                //               ],
                //             )),
                //       ),
                //     ],
                //   ),
                // ),
              ]),
            ),
          ),
          Container(
            color: formText,
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Cooking Duration',
                    style: TextStyle(
                      fontFamily: 'InterBold',
                      fontSize: 12.sp,
                      color: mainText,
                    ),
                  ),
                  Text(
                    ' (in minutes)',
                    style: TextStyle(
                      fontFamily: 'InterMedium',
                      fontSize: 12.sp,
                      color: secondaryText,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              SliderLabelWidget(
                onFileChanged: (sliderValue) {
                  setState(() {
                    log('Log: AddIngredient - Slider Value = $sliderValue');
                    index = sliderValue;
                  });
                },
              ),
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(18),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      backgroundColor: MaterialStateProperty.all(formText),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: mainText,
                        fontSize: 15,
                        fontFamily: 'InterBold',
                      ),
                    ),
                  ),
                )),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: TextButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(18),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'InterBold',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addIngredientsRow() {
    if (_countI >= 5) {
      isAtMax = true;
    } else {
      setState(() {
        _countI = _countI + 1;
      });
    }
  }

  // void _addStepsRow() {
  //   setState(() {
  //     _countS = _countS + 1;
  //   });
  // }
}
