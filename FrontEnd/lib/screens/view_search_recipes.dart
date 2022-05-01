import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_recpie_app/models/sql_recipe_search.dart';
import 'package:food_recpie_app/screens/search_recipes.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class SearchViewRecipe extends StatefulWidget {
  final SqlRecipesSeacrh? recipe;

  const SearchViewRecipe({Key? key, required this.recipe}) : super(key: key);
  @override
  _SearchViewRecipe createState() => _SearchViewRecipe();
}

class _SearchViewRecipe extends State<SearchViewRecipe> {
  @override
  Widget build(BuildContext context) {
    List<String> ingredientListin = ingredientList(widget.recipe!.recipe[2]);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.recipe!.recipe[1]),
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
                              Text(
                                "${widget.recipe!.recipe[0]}",
                                style: TextStyle(
                                  fontFamily: 'InterBold',
                                  fontSize: 25,
                                  color: mainText,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Categories",
                                        style: TextStyle(
                                          fontFamily: 'InterBold',
                                          fontSize: 18,
                                          color: mainText,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${widget.recipe!.recipe[4]}",
                                              style: TextStyle(
                                                fontFamily: 'InterMedium',
                                                fontSize: 18,
                                                color: mainText,
                                              ),
                                            ),
                                            Text(
                                              "${widget.recipe!.recipe[5]}",
                                              style: TextStyle(
                                                fontFamily: 'InterMedium',
                                                fontSize: 18,
                                                color: mainText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Cook time",
                                        style: TextStyle(
                                          fontFamily: 'InterBold',
                                          fontSize: 18,
                                          color: mainText,
                                        ),
                                      ),
                                      Text(
                                        "${widget.recipe!.recipe[6]} minutes",
                                        style: TextStyle(
                                          fontFamily: 'InterMedium',
                                          fontSize: 17,
                                          color: mainText,
                                        ),
                                      ),
                                    ],
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
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: ingredientListin.length,
                                      itemBuilder: ((context, int i) =>
                                          new IngredientWidget(
                                              ingredient: ingredientListin[i])),
                                    ),
                                    // IngredientWidget(ingredient: "Eggs")
                                  ],
                                ),
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
                                'Instruction',
                                style: TextStyle(
                                  fontFamily: 'InterBold',
                                  fontSize: 17,
                                  color: mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  '${widget.recipe!.recipe[3]}',
                                  style: TextStyle(
                                    fontFamily: 'InterMedium',
                                    fontSize: 15,
                                    color: mainText,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                width: double.maxFinite,
                                height: 220,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${widget.recipe!.recipe[1]}"),
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

//ingredient  widget
class IngredientWidget extends StatelessWidget {
  final String ingredient;
  const IngredientWidget({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 30.0,
            width: 30.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFFE3FFF8)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: ImageIcon(
                AssetImage('assets/icons/check.png'),
                color: primaryColor,
              ),
            )),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Text(
            '${ingredient}',
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontFamily: 'InterMedium',
              fontSize: 15,
              color: mainText,
            ),
          ),
        ),
      ],
    );
  }
}

//parsing string of ingredient to list of ingredients.
List<String> ingredientList(String ingredients) {
  List<String> returnRist = ingredients.split(",");

  // print(returnRist);

  return returnRist;
}
