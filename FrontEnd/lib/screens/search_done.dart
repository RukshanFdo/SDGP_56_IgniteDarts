import 'package:flutter/material.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:sizer/sizer.dart';
import '../widgets/add_filter.dart';
import '../widgets/food_item_card.dart';

class SearchDone extends StatefulWidget {
  const SearchDone({Key? key}) : super(key: key);

  @override
  _SearchDoneState createState() => _SearchDoneState();
}

class _SearchDoneState extends State<SearchDone> {
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
            Flexible(
                child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 10.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                childAspectRatio: (36.h / 65.h),
                crossAxisCount: 2,
                children: const <Widget>[
                  FoodItemCard(),
                  FoodItemCard(),
                  FoodItemCard(),
                  FoodItemCard(),
                ],
              ),
            ))
          ],
        ));
  }
}
