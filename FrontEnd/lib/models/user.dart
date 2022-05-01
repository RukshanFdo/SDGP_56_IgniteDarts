class User {
  String name;
  String email;
  String imageUrl;
  int followers;
  int following;
  int recipes;

  User(
      {required this.name,
      required this.email,
      required this.imageUrl,
      required this.followers,
      required this.following,
      required this.recipes});

  static User fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        email: json['email'],
        imageUrl: json['image'],
        followers: json['followers'],
        following: json['following'],
        recipes: json['recipes'],
      );
}
