import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:food_recpie_app/screens/add_ingredient.dart';
import 'package:food_recpie_app/widgets/slider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

import '../widgets/auth_error_alert.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final foodNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  String? imageUrl;
  bool refresh = false;
  bool isUploading = false;
  String index = '<10';

  @override
  void dispose() {
    foodNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily: 'InterBold',
                            fontSize: 12.sp,
                            color: secondaryColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      // ignore: prefer_const_constructors
                      Expanded(
                          child: const SizedBox(
                        width: double.infinity,
                      )),
                      Text(
                        '1/',
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          fontSize: 12.sp,
                          color: mainText,
                        ),
                      ),
                      Text(
                        '2',
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          fontSize: 12.sp,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      dashPattern: const [10, 10],
                      color: imageUrl == null || refresh == true
                          ? secondaryColor
                          : outlineText,
                      strokeWidth: 2,
                      child: imageUrl == null || refresh == true
                          ? InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => _selectPhoto(),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(2.h),
                                child: Column(
                                  children: <Widget>[
                                    isUploading == true
                                        ? const CircularProgressIndicator(
                                            color: primaryColor,
                                          )
                                        : ImageIcon(
                                            const AssetImage(
                                                'assets/icons/gallery.png'),
                                            size: 6.5.h,
                                            color: secondaryText,
                                          ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      'Add Cover Photo',
                                      style: TextStyle(
                                        fontFamily: 'InterBold',
                                        fontSize: 12.sp,
                                        color: secondaryText,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      '(up to 12 Mb)',
                                      style: TextStyle(
                                        fontFamily: 'InterMedium',
                                        fontSize: 11.sp,
                                        color: secondaryText,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => _removePhoto(),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(2.h),
                                child: Column(
                                  children: <Widget>[
                                    Image.network(
                                      imageUrl!,
                                      height: 8.h,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      'Remove Cover Photo',
                                      style: TextStyle(
                                        fontFamily: 'InterBold',
                                        fontSize: 12.sp,
                                        color: secondaryText,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    )
                                  ],
                                ),
                              ),
                            )),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Food Name',
                    style: TextStyle(
                      fontFamily: 'InterBold',
                      fontSize: 12.sp,
                      color: mainText,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: TextFormField(
                      controller: foodNameController,
                      validator: validateFoodName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(
                          color: mainText,
                          fontFamily: 'InterMedium',
                          fontSize: 11.sp),
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: primaryColor, width: 2.0),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: secondaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: outlineText, width: 2.0),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: outlineText, width: 2.0),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(color: secondaryColor, width: 2.0),
                        ),
                        errorStyle: const TextStyle(height: 0),
                        contentPadding: EdgeInsets.all(2.5.h),
                        hintText: 'Enter food name',
                        hintStyle: TextStyle(
                          fontFamily: 'InterMedium',
                          fontSize: 11.sp,
                          color: secondaryText,
                        ),
                      ),
                      cursorColor: primaryColor,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'InterBold',
                      fontSize: 12.sp,
                      color: mainText,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      controller: descriptionController,
                      validator: validateDescription,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(
                          color: mainText,
                          fontFamily: 'InterMedium',
                          fontSize: 11.sp),
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: primaryColor, width: 2.0),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: secondaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: outlineText, width: 2.0),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: outlineText, width: 2.0),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: secondaryColor, width: 2.0),
                        ),
                        errorStyle: const TextStyle(height: 0),
                        contentPadding: EdgeInsets.all(2.5.h),
                        hintText: 'Tell a little about your food',
                        hintStyle: TextStyle(
                          fontFamily: 'InterMedium',
                          fontSize: 11.sp,
                          color: secondaryText,
                        ),
                      ),
                      cursorColor: primaryColor,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Cooking Duration',
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          fontSize: 12.sp,
                          color: mainText,
                        ),
                      ),
                      Text(
                        ' (in minutes)',
                        style: TextStyle(
                          fontFamily: 'InterMedium',
                          fontSize: 12.sp,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SliderLabelWidget(onFileChanged: (sliderValue) {
                    setState(() {
                      log('Log: AddFood - Slider Value = $sliderValue');
                      index = sliderValue;
                    });
                  }),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: next,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(0, 2.h, 0, 2.h),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontFamily: 'InterBold',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  String? validateFoodName(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    return null;
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.camera_alt_rounded,
                        color: mainText,
                      ),
                      title: Text(
                        'Camera',
                        style: TextStyle(
                          color: mainText,
                          fontSize: 11.sp,
                          fontFamily: 'InterMedium',
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        _pickImage(ImageSource.camera);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.filter,
                        color: mainText,
                      ),
                      title: Text(
                        'Pick a file',
                        style: TextStyle(
                          color: mainText,
                          fontSize: 11.sp,
                          fontFamily: 'InterMedium',
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        _pickImage(ImageSource.gallery);
                      },
                    ),
                  ],
                )));
  }

  Future _pickImage(ImageSource gallery) async {
    final pickedFile =
        await _picker.pickImage(source: gallery, imageQuality: 50);
    if (pickedFile == null) {
      return;
    }

    var file = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
    if (file == null) {
      return;
    }
    file = await compressImage(file.path, 35);
    await _uploadFile(file.path);
  }

  Future<File> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');

    final result = await FlutterImageCompress.compressAndGetFile(path, newPath,
        quality: quality);

    return result!;
  }

  Future _uploadFile(String path) async {
    setState(() {
      isUploading = true;
    });
    try {
      final ref = storage.FirebaseStorage.instance
          .ref()
          .child('food_images')
          .child(DateTime.now().toIso8601String() + p.basename(path));

      final result = await ref.putFile(File(path));
      setState(() {});
      final fileUrl = await result.ref.getDownloadURL();

      setState(() {
        imageUrl = fileUrl;
        isUploading = false;
        refresh = false;
        log('Log: AddFood - Image URL = $imageUrl');
      });
    } on Exception catch (e) {
      showAuthErrorAlert(context, e.toString());
    }
  }

  Future _removePhoto() async {
    try {
      await storage.FirebaseStorage.instance.refFromURL(imageUrl!).delete();

      setState(() {
        refresh = true;
      });
    } on Exception catch (e) {
      showAuthErrorAlert(context, e.toString());
    }
  }

  Future next() async {
    if (_key.currentState!.validate() && checkCover() == true) {
      //if (checkCover() == false) {
      String foodName = foodNameController.text.trim();
      String description = descriptionController.text.trim();

      log('Log: AddFood - $foodName, $description, $index');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddIngredient(
            foodName: foodName,
            description: description,
            time: index,
            coverImage: imageUrl,
          ),
        ),
      );
    }
  }

  bool checkCover() {
    if (imageUrl == null || refresh == true) {
      return false;
    }
    return true;
  }
}
