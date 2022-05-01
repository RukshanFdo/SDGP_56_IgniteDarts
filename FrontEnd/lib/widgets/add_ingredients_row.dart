import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_recpie_app/screens/ingredient.dart';
import 'package:food_recpie_app/utils/search_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';

class AddIngredientsRow extends StatefulWidget {
  final String currentValue;
  final int index;
  // final int itemNumber;
  const AddIngredientsRow({
    Key? key,
    required this.currentValue,
    required this.index,
  }) : super(key: key);

  @override
  _AddIngredientsRowState createState() => _AddIngredientsRowState();
}

class _AddIngredientsRowState extends State<AddIngredientsRow> {
  late TextEditingController ingredientNameController;

  var taskItem;

  @override
  void initState() {
    super.initState();
    ingredientNameController =
        new TextEditingController(text: widget.currentValue);
  }

  @override
  void dispose() {
    // ingredientNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          const Icon(
            Icons.drag_indicator,
            color: secondaryText,
            size: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            width: 73.6.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: TextFormField(
              onFieldSubmitted: (val) {
                // print(val);
              },
              onSaved: (val) {
                Provider.of<SearchListProvider>(context, listen: false)
                    .addToList(val.toString(), widget.index);
              },
              onChanged: (val) {},
              controller: ingredientNameController,
              validator: validateIngredientName,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(
                  color: mainText, fontFamily: 'InterMedium', fontSize: 11.sp),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(color: primaryColor, width: 2.0),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(color: secondaryColor, width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(color: outlineText, width: 2.0),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(color: outlineText, width: 2.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(color: secondaryColor, width: 2.0),
                ),
                errorStyle: const TextStyle(height: 0),
                contentPadding: EdgeInsets.all(2.5.h),
                hintText: 'Enter ingredient name',
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
        ],
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }

  void callProvider() {}

  String? validateIngredientName(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }
}
