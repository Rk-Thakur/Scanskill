// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:online_learning_app/core/constants/color.dart';
// import 'package:online_learning_app/core/ui/k_text_form_field.dart';

// import 'package:online_learning_app/core/ui/textStyle.dart';
// import 'package:online_learning_app/features/homepage/view/homePage.dart';
// import 'package:page_transition/page_transition.dart';

// class ProfileSetupPage extends StatefulWidget {
//   const ProfileSetupPage({Key? key}) : super(key: key);

//   @override
//   State<ProfileSetupPage> createState() => _ProfileSetupPageState();
// }

// class _ProfileSetupPageState extends State<ProfileSetupPage> {
//   @override
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController countryController = TextEditingController();
//   final TextEditingController addressOneController = TextEditingController();
//   final TextEditingController addressTwoController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();

//   final TextEditingController phoneCodeController =
//       TextEditingController(text: "+977");
//   XFile? image;
//   Future<void> getImage() async {
//     final ImagePicker _picker = ImagePicker();

//     await _picker
//         .pickImage(source: ImageSource.gallery)
//         .then((value) => value != null
//             ? setState(() {
//                 image = value;
//               })
//             : null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         titleTextStyle: textStyle(
//           fontSize: 15.sp,
//           color: textColor,
//           fontWeight: FontWeight.bold,
//         ),
//         title: const Text("Profile Setup"),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.transparent,
//             padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0),
//             child: Column(
//               children: [
//                 // SizedBox(
//                 //   height: Platform.isAndroid
//                 //       ? MediaQuery.of(context).padding.top + 30.h
//                 //       : kToolbarHeight + 20.h,
//                 // ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Form(
//                             key: formKey,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Center(
//                                   child: SizedBox(
//                                     width: 150,
//                                     height: 110,
//                                     child: Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Positioned(
//                                             top: 10,
//                                             child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(60),
//                                               child: Center(
//                                                 child: Image.asset(
//                                                     'assets/scanskill.jpeg',
//                                                     fit: BoxFit.cover,
//                                                     width: 80,
//                                                     height: 80),
//                                               ),
//                                             )),
//                                         Positioned(
//                                           right: 35,
//                                           top: 70,
//                                           child: GestureDetector(
//                                             onTap: () async {
//                                               getImage();
//                                             },
//                                             child: Container(
//                                               width: 30.w,
//                                               height: 30.w,
//                                               decoration: BoxDecoration(
//                                                   shape: BoxShape.circle,
//                                                   color: selectedColor,
//                                                   border: Border.all(
//                                                       width: 2,
//                                                       color: Colors.white)),
//                                               child: Icon(
//                                                 Icons.camera_alt_outlined,
//                                                 size: 20.sp,
//                                                 color: Color(0xffFCFCFC),
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.all(16),
//                                   decoration: BoxDecoration(
//                                       color: containerColor,
//                                       borderRadius: BorderRadius.circular(14)),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       KTextFormField(
//                                         label: "Full Name",
//                                         hint: "Full Name",
//                                         isProfile: true,
//                                         keyboardType: TextInputType.name,
//                                         controller: fullNameController,
//                                         validator: (value) {
//                                           RegExp regex =
//                                               RegExp(r"/^[a-z][A-Z]{0-10}$/");
//                                           return regex.hasMatch(value!) ||
//                                                   (value.length <= 25 &&
//                                                       value.isNotEmpty)
//                                               ? null
//                                               : "Enter valid Name";
//                                           // if (value!.length <= 55) {
//                                           //   return 'Full Name should be exceed 18 characters ';
//                                           // } else if (value.length < 2) {
//                                           //   return 'Enter valid name';
//                                           // }
//                                         },
//                                       ),
//                                       KTextFormField(
//                                         label: "Phone",
//                                         controller: phoneController,
//                                         hint: "Phone number",
//                                         isProfile: true,
//                                         keyboardType: TextInputType.number,
//                                         validator: (value) {
//                                           RegExp regex = RegExp(
//                                               r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$");
//                                           return value == null || value.isEmpty
//                                               ? null
//                                               : regex.hasMatch(value)
//                                                   ? null
//                                                   : "Enter valid Phone number";
//                                         },
//                                       ),
//                                       KTextFormField(
//                                         label: "Address",
//                                         controller: addressOneController,
//                                         hint: "Address",
//                                         isProfile: true,
//                                         validator: (value) {
//                                           return value!.length <= 25
//                                               ? null
//                                               : "Address should not exceed 25 characters.";
//                                         },
//                                       ),
//                                       KTextFormField(
//                                         label: "Address",
//                                         controller: addressOneController,
//                                         hint: "Address",
//                                         isProfile: true,
//                                         validator: (value) {
//                                           return value!.length <= 25
//                                               ? null
//                                               : "Address should not exceed 25 characters.";
//                                         },
//                                       ),
//                                       KTextFormField(
//                                         label: "Address",
//                                         controller: addressOneController,
//                                         hint: "Address",
//                                         isProfile: true,
//                                         validator: (value) {
//                                           return value!.length <= 25
//                                               ? null
//                                               : "Address should not exceed 25 characters.";
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ]),
//                   ),
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.symmetric(vertical: 16.h),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             primary: selectedColor,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 6.h, horizontal: 42.w),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                         onPressed: () {
//                           // if (!formKey.currentState!.validate()) {
//                           //   return;
//                           // }
//                           // FocusScope.of(context).unfocus();
//                           Navigator.of(context).push(
//                             PageTransition(
//                                 type: PageTransitionType.fade,
//                                 child: const HomePage()),
//                           );
//                         },
//                         child: Text(
//                           'Save',
//                           style: TextStyle(
//                               fontFamily: "Raleway",
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold),
//                         ))),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
