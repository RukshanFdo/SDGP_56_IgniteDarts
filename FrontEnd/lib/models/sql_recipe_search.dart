import 'dart:convert';

String sqlRecipesSeacrhToJson(List<SqlRecipesSeacrh> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SqlRecipesSeacrh {
  SqlRecipesSeacrh({
    required this.count,
    required this.recipe,
    required this.time,
  });

  int count;
  List<String> recipe;
  int time;

  factory SqlRecipesSeacrh.fromJson(Map<String, dynamic> json) =>
      SqlRecipesSeacrh(
        count: json["count"],
        recipe: List<String>.from(json["recipe"].map((x) => x)),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "recipe": List<dynamic>.from(recipe.map((x) => x)),
        "time": time,
      };
}
