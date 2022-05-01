import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/search_done.dart';
import 'package:food_recpie_app/utils/colors.dart';
import '../widgets/add_filter.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String index = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: formText,
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(25, 60, 25, 25),
            height: 150.0,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                InkWell(
                  child: const ImageIcon(
                    AssetImage('assets/icons/back.png'),
                    color: mainText,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: formText,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: const TextField(
                      style: TextStyle(
                          color: mainText,
                          fontFamily: 'InterMedium',
                          fontSize: 15),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: mainText,
                        ),
                        suffixIcon: Icon(
                          Icons.clear,
                          color: mainText,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: secondaryText,
                        ),
                        border: InputBorder.none,
                      ),
                      cursorColor: primaryColor,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                InkWell(
                  child: const ImageIcon(
                    AssetImage('assets/icons/filter.png'),
                    color: mainText,
                  ),
                  onTap: () {
                    showAddFilterBottomSheet(context, index);
                  },
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              margin: const EdgeInsets.only(top: 10.0),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const ImageIcon(
                        AssetImage('assets/icons/clock.png'),
                        color: secondaryText,
                      ),
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            child: const Text(
                              'Pancakes',
                              style: TextStyle(
                                color: mainText,
                                fontSize: 15,
                                fontFamily: 'InterMedium',
                              ),
                            )),
                      ),
                      const ImageIcon(
                        AssetImage('assets/icons/arrow.png'),
                        color: secondaryText,
                        size: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const ImageIcon(
                        AssetImage('assets/icons/clock.png'),
                        color: secondaryText,
                      ),
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            child: const Text(
                              'Salad',
                              style: TextStyle(
                                color: mainText,
                                fontSize: 15,
                                fontFamily: 'InterMedium',
                              ),
                            )),
                      ),
                      const ImageIcon(
                        AssetImage('assets/icons/arrow.png'),
                        color: secondaryText,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Enter ingridents',
                      style: TextStyle(
                        color: mainText,
                        fontSize: 17,
                        fontFamily: 'InterBold',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
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
                              'sushi',
                              style: TextStyle(
                                color: mainText,
                                fontSize: 15,
                                fontFamily: 'InterMedium',
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20.0),
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
                                    MaterialStateProperty.all(formText),
                              ),
                              child: const Text(
                                'sandwich',
                                style: TextStyle(
                                  color: mainText,
                                  fontSize: 15,
                                  fontFamily: 'InterMedium',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
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
                              'seafood',
                              style: TextStyle(
                                color: mainText,
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
                                        borderRadius:
                                            BorderRadius.circular(22.0))),
                                backgroundColor:
                                    MaterialStateProperty.all(formText),
                              ),
                              child: const Text(
                                'fried rice',
                                style: TextStyle(
                                  color: mainText,
                                  fontSize: 15,
                                  fontFamily: 'InterMedium',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
