import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recpie_app/models/user.dart' as u;
import 'package:food_recpie_app/screens/search.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:sizer/sizer.dart';
import '../models/recipe.dart';
import 'profile.dart';
import 'view_recipe.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isRightPressed = false;
  bool isAllPressed = true;
  bool isFoodPressed = false;
  bool isDrinkPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: formText,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5.5.w, 7.h, 3.5.w, 3.5.h),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(1.h),
                    alignment: Alignment.center,
                    height: 7.h,
                    decoration: const BoxDecoration(
                        color: formText,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: InkWell(
                      child: IgnorePointer(
                        child: TextField(
                          style: TextStyle(
                              color: mainText,
                              fontFamily: 'InterMedium',
                              fontSize: 11.sp),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Search()),
                        );
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontFamily: 'InterBold',
                      fontSize: 12.sp,
                      color: mainText,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isAllPressed = true;
                            isDrinkPressed = false;
                            isFoodPressed = false;
                          });
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0))),
                          backgroundColor: MaterialStateProperty.all(
                              isAllPressed == true ? primaryColor : formText),
                        ),
                        child: isAllPressed == true
                            ? Text(
                                'All',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                  fontFamily: 'InterMedium',
                                ),
                              )
                            : Text(
                                'All',
                                style: TextStyle(
                                  color: secondaryText,
                                  fontSize: 11.sp,
                                  fontFamily: 'InterMedium',
                                ),
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isAllPressed = false;
                              isDrinkPressed = false;
                              isFoodPressed = true;
                            });
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(15),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0))),
                            backgroundColor: MaterialStateProperty.all(
                                isFoodPressed == true
                                    ? primaryColor
                                    : formText),
                          ),
                          child: isFoodPressed == true
                              ? Text(
                                  'Food',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontFamily: 'InterMedium',
                                  ),
                                )
                              : Text(
                                  'Food',
                                  style: TextStyle(
                                    color: secondaryText,
                                    fontSize: 11.sp,
                                    fontFamily: 'InterMedium',
                                  ),
                                ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isAllPressed = false;
                              isDrinkPressed = true;
                              isFoodPressed = false;
                            });
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(15),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0))),
                            backgroundColor: MaterialStateProperty.all(
                                isDrinkPressed == true
                                    ? primaryColor
                                    : formText),
                          ),
                          child: isDrinkPressed == true
                              ? Text(
                                  'Drink',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontFamily: 'InterMedium',
                                  ),
                                )
                              : Text(
                                  'Drink',
                                  style: TextStyle(
                                    color: secondaryText,
                                    fontSize: 11.sp,
                                    fontFamily: 'InterMedium',
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1.h),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isRightPressed = false;
                      });
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(2.h)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: isRightPressed == true
                        ? Text(
                            'Left',
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 11.sp,
                              fontFamily: 'InterBold',
                            ),
                          )
                        : Text(
                            'Left',
                            style: TextStyle(
                              color: mainText,
                              fontSize: 11.sp,
                              fontFamily: 'InterBold',
                            ),
                          ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          isRightPressed = true;
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(2.h)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: isRightPressed == true
                          ? Text(
                              'Right',
                              style: TextStyle(
                                color: mainText,
                                fontSize: 11.sp,
                                fontFamily: 'InterBold',
                              ),
                            )
                          : Text(
                              'Right',
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 11.sp,
                                fontFamily: 'InterBold',
                              ),
                            )),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                height: isRightPressed == true ? 0.2.h : 0.6.h,
                color: isRightPressed == true ? outlineText : primaryColor,
              )),
              Expanded(
                  child: Container(
                height: isRightPressed == true ? 0.6.h : 0.2.h,
                color: isRightPressed == true ? primaryColor : outlineText,
              )),
            ],
          ),
          Flexible(
              child: Container(
                  color: Colors.white,
                  child: StreamBuilder<List<Recipe>>(
                    stream: readRecipes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return AlertDialog(
                          title: const Text(
                            'Error',
                            style: TextStyle(color: mainText),
                          ),
                          content: Text(
                            snapshot.error.toString(),
                            style: const TextStyle(color: secondaryText),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 20.0),
                          backgroundColor: Colors.white,
                          actions: const [],
                        );
                      } else if (snapshot.hasData) {
                        final recipes = snapshot.data!;

                        return GridView.count(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          childAspectRatio: (30.h / 60.h),
                          crossAxisCount: 2,
                          children: recipes.map(buildRecipe).toList(),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        );
                      }
                    },
                  )))
        ],
      ),
    );
  }

  Stream<List<Recipe>> readRecipes() => FirebaseFirestore.instance
      .collection('recipes')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

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

  Future<u.User?> readUser(String uid) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return u.User.fromJson(snapshot.data()!);
    }
    return null;
  }

  Widget buildRecipe(Recipe recipe) => Card(
      margin: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 0),
      color: Colors.white,
      elevation: 0,
      child: Column(
        children: <Widget>[
          FutureBuilder<u.User?>(
              future: readUser(recipe.pubUid),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container();
                } else if (snapshot.hasData) {
                  final user = snapshot.data;
                  return user == null ? const Text('') : buildUserProfile(user);
                } else {
                  return Container();
                }
              }),
          Stack(
            children: <Widget>[
              InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 2.5.h, 0, 1.h),
                    width: 20.3.h,
                    height: 20.3.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(recipe.imageUrl),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewRecipe(),
                      ),
                    );
                  }),
              Positioned(
                right: 3.w,
                bottom: 15.h,
                child: Center(
                    child: buildBlur(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: formText.withOpacity(0.3),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const ImageIcon(
                      AssetImage('assets/icons/heart.png'),
                      color: Colors.white,
                    ),
                  ),
                )),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              recipe.name,
              style: TextStyle(
                color: mainText,
                fontSize: 13.sp,
                fontFamily: 'InterBold',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 1.5.h, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${recipe.category1} • >${recipe.time}',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 11.sp,
                  fontFamily: 'InterMedium',
                ),
              ),
            ),
          )
        ],
      ));

  Widget buildUserProfile(u.User? user) => Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
            height: 7.h,
            width: 7.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(user!.imageUrl),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          InkWell(
            child: Text(
              user.name,
              style: TextStyle(
                color: mainText,
                fontSize: 11.sp,
                fontFamily: 'InterMedium',
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          )
        ],
      );
}

  // Future<u.User?> readUser() async {
  //   GoogleSignInProvider googleSignInProvider =
  //       Provider.of<GoogleSignInProvider>(context, listen: false);
  //   String? uid = await googleSignInProvider.returnUid();
  //   final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
  //   final snapshot = await docUser.get();

  //   if (snapshot.exists) {
  //     return u.User.fromJson(snapshot.data()!);
  //   }
  // }

  // FutureBuilder<u.User?>(
  //             future: readUser(),
  //             builder: (context, snapshot) {
  //               if (snapshot.hasError) {
  //                 return AlertDialog(
  //                   title: const Text(
  //                     'Error',
  //                     style: TextStyle(color: mainText),
  //                   ),
  //                   content: Text(
  //                     snapshot.error.toString(),
  //                     style: const TextStyle(color: secondaryText),
  //                   ),
  //                   contentPadding:
  //                       const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 20.0),
  //                   backgroundColor: Colors.white,
  //                   actions: const [],
  //                 );
  //               } else if (snapshot.hasData) {
  //                 final user = snapshot.data;

  //                 return user == null ? const Text('') : buildUserProfile(user);
  //               } else {
  //                 return Container();
  //               }
  //             }),