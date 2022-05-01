import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recpie_app/api/backend.dart';
import 'package:food_recpie_app/models/recipe.dart';
import 'package:food_recpie_app/models/sql_recipe.dart';
import 'package:food_recpie_app/models/sql_recipe_search.dart';
import 'package:food_recpie_app/screens/view_recipe.dart';
import 'package:food_recpie_app/screens/view_search_recipes.dart';
import 'package:food_recpie_app/utils/search_list_provider.dart';
import 'package:food_recpie_app/widgets/food_item_card.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchRecipies extends StatefulWidget {
  const SearchRecipies({Key? key}) : super(key: key);

  @override
  State<SearchRecipies> createState() => _SearchRecipiesState();
}

class _SearchRecipiesState extends State<SearchRecipies> {
  // List<SqlRecipesSeacrh> searchItem = [];
  String listOfIng1 = '';

  @override
  void initState() {
    super.initState();
    List<String> listOfIngredients =
        Provider.of<SearchListProvider>(context, listen: false).ingredientList;
    String listToString = listOfIngredients.join(',');
    // print(" List of String : ${listToString}");

    // String listOfIng =
    //     "Tomato,Mustard seeds,Thin tamarind juice,Thick coconut milk,Banana pepper";
    listOfIng1 = listToString;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Scrollbar(
          child: Column(children: [
            Center(
              child: Text("Search Recipies",
                  style: TextStyle(
                    fontFamily: 'InterBold',
                    fontSize: 30,
                    color: mainText,
                  )),
            ),
            Expanded(
              child: FutureBuilder<List<SqlRecipesSeacrh>?>(
                future: getByIngredient(listOfIng1),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("Error");
                  }
                  if (snapshot.hasData) {
                    List<SqlRecipesSeacrh>? recipes = snapshot.data!;
                    print(recipes.length);
                    for (var item in recipes) {
                      print(item.recipe[0]);
                    }

                    return SingleChildScrollView(
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        // axisDirection: AxisDirection(),
                        children: recipes.map(buildRecipe).toList(),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  //Single recipe card widget
  Widget buildRecipe(SqlRecipesSeacrh? recipe) => Card(
      margin: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 0),
      color: Colors.white,
      elevation: 0,
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                InkWell(
                    // Image
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 2.5.h, 0, 1.h),
                      width: 22.3.h,
                      height: 19.3.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(recipe!.recipe[1]),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchViewRecipe(recipe: recipe),
                        ),
                      );
                    }),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                recipe.recipe[0],
                style: TextStyle(
                  color: mainText,
                  fontSize: 13.sp,
                  fontFamily: 'InterBold',
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(0, 1.5.h, 0, 0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       '${recipe.recipe[4]} • >${recipe.time}',
            //       style: TextStyle(
            //         color: secondaryText,
            //         fontSize: 11.sp,
            //         fontFamily: 'InterMedium',
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ));
}
