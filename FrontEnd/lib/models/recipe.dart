class Recipe {
  String name;
  String time;
  String pubUid;
  String category1;
  String category2;
  String instructions;
  String likes;
  String ingredient;
  String imageUrl;
  String description;
  List<String> coreIngredients;

  Recipe({
    required this.name,
    required this.time,
    required this.pubUid,
    required this.category1,
    required this.category2,
    required this.likes,
    required this.imageUrl,
    required this.description,
    required this.ingredient,
    required this.instructions,
    required this.coreIngredients,
  });

  static Recipe fromJson(Map<String, dynamic> json) => Recipe(
      name: json['name'],
      time: json['time'],
      pubUid: json['publisher'],
      likes: json['likes'],
      description: json['description'],
      ingredient: json['ingredeient'],
      coreIngredients: List<String>.from(['coreIngrdients']),
      category1: json['category1'],
      category2: json['category2'],
      imageUrl: json['image'],
      instructions: json['insructions']);
}
