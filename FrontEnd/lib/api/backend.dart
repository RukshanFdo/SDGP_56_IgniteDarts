import 'dart:convert';

import 'package:food_recpie_app/models/sql_recipe.dart';
import 'package:food_recpie_app/models/sql_recipe_search.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:http/http.dart';

var client = http.Client();

// get all the recipes from mysql database
Future<List> getData() async {
  print("Backend Code");

  var url = Uri.parse('http://10.0.2.2:5000/');
  var response = await http.get(url);

  List list = (jsonDecode(response.body)) as List<dynamic>;

  print(list[0][4]);

  return list;
}

//get from ingredients
Future<List<SqlRecipesSeacrh>?> getByIngredient(String listOfIng) async {
  try {
    final queryParam = {'ingredients': listOfIng};

    var uri = Uri.http('10.0.2.2:5000', '/getbyingredient', queryParam);
    var response = await http.get(uri);

    List<SqlRecipesSeacrh> sqlRecipesSeacrhFromJson(String str) =>
        List<SqlRecipesSeacrh>.from(
            json.decode(str).map((x) => SqlRecipesSeacrh.fromJson(x)));

    return await (sqlRecipesSeacrhFromJson(response.body));
    // return await (sqlRecipesSeacrhFromJson(response.body)).toSet().toList();

    // print(res[1].recipe[1]);
  } catch (e) {
    print(e);
    return null;
  }
}
