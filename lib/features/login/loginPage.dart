// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:online_learning_app/core/constants/color.dart';
// import 'package:online_learning_app/features/profile/category/category.dart';

// import 'package:online_learning_app/core/ui/textStyle.dart';
// import 'package:online_learning_app/features/utils/route.dart';
// import 'package:page_transition/page_transition.dart';

// import '../homepage/view/homePage.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final emailController = TextEditingController();

//   final passwordController = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   int? _selectedListIndex;

//   onButtonTapped(int index) {
//     setState(() {
//       _selectedListIndex = index;
//     });
//   }

//   List<SocialIcon> socialIcon = [
//     SocialIcon(
//         icon: Icon(
//           FontAwesomeIcons.google,
//           color: Colors.white,
//           size: 25.sp,
//         ),
//         name: 'Continue with Google'),
//     SocialIcon(
//         icon: Icon(
//           FontAwesomeIcons.apple,
//           color: Colors.white,
//           size: 27.sp,
//         ),
//         name: 'Continue with Apple'),
//     SocialIcon(
//         icon: Icon(
//           FontAwesomeIcons.github,
//           color: Colors.white,
//           size: 25.sp,
//         ),
//         name: 'Continue with Github'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Container(
//               // color: Colors.black,
//               height: 325.h,
//               width: double.infinity,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     "assets/scanskill.jpeg",
//                     height: 120.h,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               height: 330.h,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: containerColor,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   )),
//               child: Padding(
//                 padding: EdgeInsets.only(top: 10.sp, right: 10.sp, left: 10.sp),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pushNamed(homeScreen);
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         height: 50.h,
//                         decoration: BoxDecoration(
//                             color: selectedColor,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Skip For Now',
//                               style: textStyle(
//                                 color: white,
//                                 letterSpacing: 1,
//                                 fontSize: 15.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 60.h,
//                       width: double.infinity,
//                       // color: Colors.pink,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: 1.h,
//                             width: 56.w,
//                             color: listTextColor,
//                           ),
//                           SizedBox(
//                             width: 16.w,
//                           ),
//                           Text("Or Connect with",
//                               style: textStyle(
//                                 color: listTextColor,
//                                 fontSize: 12.sp,
//                                 letterSpacing: 1,
//                                 fontWeight: FontWeight.bold,
//                               )),
//                           SizedBox(
//                             width: 16.w,
//                           ),
//                           Container(
//                             height: 1.h,
//                             width: 56.w,
//                             color: Color(0xff1C1B1F),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ...socialIcon.map((e) => Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).push(
//                                   PageTransition(
//                                       type: PageTransitionType.fade,
//                                       child: CategoryPage()),
//                                 );
//                               },
//                               child: Container(
//                                 width: double.infinity,
//                                 height: 50.h,
//                                 decoration: BoxDecoration(
//                                     color: selectedColor,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     e.icon,
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     Text(
//                                       e.name,
//                                       style: textStyle(
//                                         color: Colors.white,
//                                         fontSize: 15.sp,
//                                         letterSpacing: 1,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 15.h,
//                             ),
//                           ],
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SocialIcon {
//   Icon icon;
//   String name;
//   SocialIcon({
//     required this.icon,
//     required this.name,
//   });
// }
