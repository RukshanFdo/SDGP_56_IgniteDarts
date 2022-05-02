// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import '../utils/colors.dart';

// class AddStepsRow extends StatefulWidget {
//   final int count;
//   const AddStepsRow({Key? key, required this.count}) : super(key: key);

//   @override
//   _AddStepsRowState createState() => _AddStepsRowState();
// }

// class _AddStepsRowState extends State<AddStepsRow> {
//   int count = 0;
//   final stepsController = TextEditingController();
//   final GlobalKey<FormState> _key = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     stepsController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();

//     count = widget.count;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _key,
//       child: Column(children: <Widget>[
//         Row(
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Container(
//                     height: 30.0,
//                     width: 30.0,
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: mainText),
//                     child: Padding(
//                         padding: const EdgeInsets.all(5),
//                         child: Center(
//                           child: Text(
//                             '$count',
//                             style: const TextStyle(
//                               fontFamily: 'assets/fonts/InterBold',
//                               fontSize: 15,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ))),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Icon(
//                   Icons.drag_indicator,
//                   color: secondaryText,
//                   size: 30,
//                 ),
//                 const SizedBox(
//                   height: 85,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             Column(
//               children: <Widget>[
//                 Container(
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width / 1.31,
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                   child: TextFormField(
//                     controller: stepsController,
//                     validator: validateSteps,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     style: TextStyle(
//                         color: mainText,
//                         fontFamily: 'InterMedium',
//                         fontSize: 11.sp),
//                     decoration: InputDecoration(
//                       focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(color: primaryColor, width: 2.0),
//                       ),
//                       focusedErrorBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide:
//                             BorderSide(color: secondaryColor, width: 2.0),
//                       ),
//                       enabledBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(color: outlineText, width: 2.0),
//                       ),
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(color: outlineText, width: 2.0),
//                       ),
//                       errorBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide:
//                             BorderSide(color: secondaryColor, width: 2.0),
//                       ),
//                       errorStyle: const TextStyle(height: 0),
//                       contentPadding: EdgeInsets.all(2.5.h),
//                       hintText: 'Tell a little about your food',
//                       hintStyle: TextStyle(
//                         fontFamily: 'InterMedium',
//                         fontSize: 11.sp,
//                         color: secondaryText,
//                       ),
//                     ),
//                     cursorColor: primaryColor,
//                     maxLines: 3,
//                     keyboardType: TextInputType.multiline,
//                     textInputAction: TextInputAction.done,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width / 1.31,
//                   child: TextButton(
//                       onPressed: () {},
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                           const EdgeInsets.fromLTRB(0, 13, 0, 13),
//                         ),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0))),
//                         backgroundColor: MaterialStateProperty.all(formText),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const <Widget>[
//                           Icon(
//                             Icons.camera_alt_rounded,
//                             color: mainText,
//                           ),
//                         ],
//                       )),
//                 ),
//               ],
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//       ]),
//     );
//   }

//   String? validateSteps(String? value) {
//     if (value == null || value.isEmpty) {
//       return '';
//     }

//     return null;
//   }
// }
