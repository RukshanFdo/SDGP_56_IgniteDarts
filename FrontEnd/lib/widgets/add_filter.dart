import 'package:flutter/material.dart';
import 'package:food_recpie_app/widgets/slider.dart';
import '../screens/search_done.dart';
import '../utils/colors.dart';

void showAddFilterBottomSheet(context, index) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
          builder: ((context, setState) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
                child: Column(children: <Widget>[
                  const Text(
                    'Add a Filter',
                    style: TextStyle(
                      color: mainText,
                      fontSize: 17,
                      fontFamily: 'InterBold',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Category',
                      style: TextStyle(
                        color: mainText,
                        fontSize: 17,
                        fontFamily: 'InterBold',
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                        ),
                        child: const Text(
                          'All',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'InterMedium',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(15),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: outlineText,
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(22.0))),
                          ),
                          child: const Text(
                            'Food',
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 15,
                              fontFamily: 'InterMedium',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(15),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: outlineText,
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(22.0))),
                          ),
                          child: const Text(
                            'Drink',
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 15,
                              fontFamily: 'InterMedium',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 40.0, bottom: 25.0),
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: const <Widget>[
                          Text(
                            'Cooking Duration ',
                            style: TextStyle(
                              color: mainText,
                              fontSize: 17,
                              fontFamily: 'InterBold',
                            ),
                          ),
                          Text(
                            '(in minutes)',
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 17,
                              fontFamily: 'InterMedium',
                            ),
                          ),
                        ],
                      )),
                  SliderLabelWidget(onFileChanged: (sliderValue) {
                    setState(() {
                      index = sliderValue;
                    });
                  }),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(15),
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0))),
                              backgroundColor:
                                  MaterialStateProperty.all(formText),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: mainText,
                                fontSize: 15,
                                fontFamily: 'InterMedium',
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchDone(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(15),
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0))),
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                              ),
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'InterMedium',
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              )))));
}
