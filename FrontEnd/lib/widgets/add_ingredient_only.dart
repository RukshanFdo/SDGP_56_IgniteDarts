import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:food_recpie_app/api/backend.dart';
import 'package:food_recpie_app/screens/search_recipes.dart';
import 'package:food_recpie_app/widgets/error_ingredient.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/search_list_provider.dart';
import '../widgets/add_ingredients_row.dart';
import 'slider.dart';
import '../widgets/success_alert.dart';

import 'package:http/http.dart' as http;

class AddIngredientOnly extends StatefulWidget {
  const AddIngredientOnly({Key? key}) : super(key: key);

  @override
  _AddIngredientOnlyState createState() => _AddIngredientOnlyState();
}

class _AddIngredientOnlyState extends State<AddIngredientOnly> {
  // HttpBackend httpB = new HttpBackend();
  int _countI = 2;
  bool isAtMax = false;
  //int _countS = 1;
  String index = '<10';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> _ingredients = List.generate(
        _countI,
        (int i) => AddIngredientsRow(
              currentValue: "",
              index: i,
            ));

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
                      Form(
                        key: _formKey,
                        child: ListView(
                          children: _ingredients,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                            onPressed: () {
                              if (_countI >= 5)
                                return showAlertDialogError(
                                    context, 'You can add only 5 Ingredients');
                              else {
                                return _addIngredientsRow();
                              }
                            },
                            // isAtMax == true
                            //     ? () {
                            //         showAlertDialogError(context);
                            //       }
                            //     : _addIngredientsRow,
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
                    Provider.of<SearchListProvider>(context, listen: false)
                        .changeDuration(sliderValue);
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
                      onPressed: () async {
                        List<String> listOfIngredients =
                            Provider.of<SearchListProvider>(context,
                                    listen: false)
                                .ingredientList;

                        final isValid = _formKey.currentState!.validate();

                        if (isValid) {
                          _formKey.currentState!.save();
                        }
                        int num = 0;
                        listOfIngredients.forEach((element) {
                          if (element == '' ||
                              element == null ||
                              element.isEmpty) {
                            num++;
                          }
                        });
                        if (num > 2) {
                          showAlertDialogError(context,
                              'You need to add at least two ingredients');
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchRecipies()),
                          );
                        }
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
    // if (_countI > 5) {
    //   setState(() {
    //     isAtMax = true;
    //   });
    // } else {
    //   setState(() {
    //     _countI = _countI + 1;
    //   });
    // }
    setState(() {
      if (_countI >= 5) {
        isAtMax = true;
      } else {
        _countI = _countI + 1;
      }
    });
  }

  // void _addStepsRow() {
  //   setState(() {
  //     _countS = _countS + 1;
  //   });
  // }
}

// Alert box pop up when ingredient = 5

void _showMaterialDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('You can add only 5 ingredients.')),
          actions: <Widget>[
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok')),
            ),
          ],
        );
      });
}
