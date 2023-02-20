// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'core/constants/color.dart';
// import 'core/ui/textStyle.dart';

// class Testing extends StatefulWidget {
//   @override
//   State<Testing> createState() => _TestingState();
// }

// class _TestingState extends State<Testing> {
//   final emailController = TextEditingController();

//   final passwordController = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   List<int> selectedCatergory = [];

//   int? _selectedListIndex;

//   onButtonTapped(int index) {
//     setState(() {
//       _selectedListIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           // backgroundColor: Colors.red,
//           body: Container(
//         margin: const EdgeInsets.all(10),
//         child: list(context),
//       )),
//     );
//   }

//   Widget list(BuildContext context) {
//     return ListView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     child: Container(
//                       width: 175.w,
//                       height: 250.h,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.sp),
//                         // color: const Color(0xffE6E6E6),
//                         color: containerColor,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 15.sp, vertical: 10.sp),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Stack(
//                               children: [
//                                 Container(
//                                   height: 6,
//                                   margin: const EdgeInsets.only(top: 4),
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                       color: Color.fromARGB(255, 203, 202, 207),
//                                       borderRadius: BorderRadius.circular(50)),
//                                   child: Text(''),
//                                 ),
//                                 Container(
//                                   height: 6,
//                                   margin: const EdgeInsets.only(top: 4),
//                                   width: 64,
//                                   decoration: BoxDecoration(
//                                       color: progressBarColor,
//                                       borderRadius: BorderRadius.circular(50)),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 4.h,
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 'Introduction',
//                                 style: textStyle(
//                                   fontSize: 9.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Container(
//                                 width: 50.w,
//                                 height: 45.h,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: textColor,
//                                 ),
//                                 child: Icon(
//                                   FontAwesomeIcons.ghost,
//                                   color: iconColor,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 8.h,
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 'What is okay?',
//                                 style: TextStyle(
//                                     color: textColor,
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 6.h,
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     'okay is widely\nused program\ndynamic websites',
//                                     style: textStyle(
//                                       color: textColor,
//                                       fontSize: 11.sp,
//                                       letterSpacing: 1,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "30 min",
//                                   style: textStyle(
//                                     fontSize: 9.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: textColor,
//                                   ),
//                                 ),
//                                 IconButton(
//                                     onPressed: () async {},
//                                     icon: Icon(
//                                       Icons.arrow_forward,
//                                       color: iconColor,
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 175.w,
//                     height: 250.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.sp),
//                       // color: const Color(0xffE6E6E6),
//                       // color: Colors.red,
//                     ),
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           child: Container(
//                             width: double.infinity,
//                             height: 120.h,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               // color: const Color(0xffE6E6E6),
//                               color: unselectedColor,
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 15.sp, vertical: 8.sp),
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                     height: 5.h,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       'Login',
//                                       style: textStyle(
//                                         fontSize: 10.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: white,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 6.h,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text('Login for \nDashbord',
//                                         style: TextStyle(
//                                             color: white,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold)),
//                                   ),
//                                   SizedBox(
//                                     height: 5.h,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           'Give you access to premium content',
//                                           style: textStyle(
//                                             color: white,
//                                             fontSize: 10.sp,
//                                             letterSpacing: 1,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         GestureDetector(
//                           child: Container(
//                             width: double.infinity,
//                             height: 120.h,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               // color: const Color(0xffE6E6E6),
//                               color: containerColor,
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 15.sp, vertical: 10.sp),
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                     height: 5.h,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       'VLOG',
//                                       style: textStyle(
//                                         fontSize: 9.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: textColor,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 6.h,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text('Learn okay\nFrameWork',
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             color: textColor,
//                                             fontWeight: FontWeight.bold)),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           'widely used program dynamic websites',
//                                           style: textStyle(
//                                             fontSize: 10.sp,
//                                             color: textColor,
//                                             letterSpacing: 1,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 175.w,
//                     height: 250.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.sp),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 120.h,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.sp),
//                             color: containerColor,
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15.sp, vertical: 10.sp),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   height: 5.h,
//                                 ),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'Articles',
//                                     style: textStyle(
//                                       fontSize: 10.sp,
//                                       fontWeight: FontWeight.w600,
//                                       color: textColor,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5.h,
//                                 ),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text('Tips for better\nokay',
//                                       style: TextStyle(
//                                           color: textColor,
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                                 SizedBox(
//                                   height: 5.h,
//                                 ),
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         'okay is widely used program dynamic websites',
//                                         style: textStyle(
//                                           color: textColor,
//                                           fontSize: 10.sp,
//                                           letterSpacing: 1,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             width: double.infinity,
//                             height: 120.h,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               // color: const Color(0xffE6E6E6),
//                               color: containerColor,
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 15.sp, vertical: 10.sp),
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                     height: 5.h,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       'VLOG',
//                                       style: textStyle(
//                                         fontSize: 9.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: textColor,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 6.h,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text('Learnokay FrameWork',
//                                         style: TextStyle(
//                                             color: textColor,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold)),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           'widely used program dynamic websites',
//                                           style: textStyle(
//                                             fontSize: 10.sp,
//                                             letterSpacing: 1,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 175.w,
//                     height: 250.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.sp),
//                       // color: const Color(0xffE6E6E6),
//                       color: containerColor,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 15.sp, vertical: 10.sp),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           Stack(
//                             children: [
//                               Container(
//                                 height: 6,
//                                 margin: const EdgeInsets.only(top: 4),
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: Color.fromARGB(255, 203, 202, 207),
//                                     borderRadius: BorderRadius.circular(50)),
//                                 child: Text(''),
//                               ),
//                               Container(
//                                 height: 6,
//                                 margin: const EdgeInsets.only(top: 4),
//                                 width: 64,
//                                 decoration: BoxDecoration(
//                                     color: progressBarColor,
//                                     borderRadius: BorderRadius.circular(50)),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 4.h,
//                           ),
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               'Introduction',
//                               style: textStyle(
//                                 fontSize: 9.sp,
//                                 fontWeight: FontWeight.w600,
//                                 color: textColor,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Container(
//                               width: 50.w,
//                               height: 45.h,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: textColor,
//                               ),
//                               child: Icon(
//                                 FontAwesomeIcons.ghost,
//                                 color: iconColor,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 8.h,
//                           ),
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               'What is okay?',
//                               style: TextStyle(
//                                   color: textColor,
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6.h,
//                           ),
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'okay is widely\nused program\ndynamic websites',
//                                   style: textStyle(
//                                     fontSize: 11.sp,
//                                     color: textColor,
//                                     letterSpacing: 1,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "30 min",
//                                 style: textStyle(
//                                   fontSize: 9.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor,
//                                 ),
//                               ),
//                               IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.arrow_forward,
//                                     color: iconColor,
//                                   ))
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//             ],
//           );
//         });
//   }

//   Widget masonryLayout(BuildContext context) {
//     return MasonryGridView.builder(
//         scrollDirection: Axis.vertical,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         itemCount: 30,
//         gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemBuilder: (context, index) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child:
//                 Image.network('https://source.unsplash.com/random?sig=$index'),
//           );
//         });
//   }

//   Widget alignlayout(BuildContext context) {
//     return AlignedGridView.count(
//         scrollDirection: Axis.vertical,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         itemCount: 30,
//         crossAxisCount: 2,
//         itemBuilder: (context, index) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.network(
//               'https://source.unsplash.com/random?sig=$index',
//               fit: BoxFit.cover,
//             ),
//           );
//         });
//   }

//   Widget staglayout(BuildContext context) {
//     return StaggeredGrid.count(
//       crossAxisCount: 4,
//       mainAxisSpacing: 4,
//       crossAxisSpacing: 4,
//       children: [
//         StaggeredGridTile.count(
//           crossAxisCellCount: 2,
//           mainAxisCellCount: 2,
//           child: Container(
//             width: 175.w,
//             height: 250.h,
//             color: Colors.red,
//             child: Text("testing"),
//           ),
//         ),
//         StaggeredGridTile.count(
//           crossAxisCellCount: 2,
//           mainAxisCellCount: 1,
//           child: Container(
//             width: double.infinity,
//             height: 100,
//             color: Colors.red,
//             child: Container(
//               width: 175.w,
//               height: 120.h,
//               color: Colors.red,
//               child: Text("testing"),
//             ),
//           ),
//         ),
//         StaggeredGridTile.count(
//           crossAxisCellCount: 2,
//           mainAxisCellCount: 1,
//           child: Container(
//             width: double.infinity,
//             height: 100,
//             color: Colors.red,
//             child: Container(
//               width: 175.w,
//               height: 120.h,
//               color: Colors.red,
//               child: Text("testing"),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget quiltedLayout(BuildContext context) {
//     return GridView.custom(
//       gridDelegate: SliverQuiltedGridDelegate(
//           repeatPattern: QuiltedGridRepeatPattern.inverted,
//           mainAxisSpacing: 6,
//           crossAxisSpacing: 6,
//           crossAxisCount: 4,
//           pattern: const [
//             QuiltedGridTile(2, 2),
//             QuiltedGridTile(1, 2),
//             QuiltedGridTile(1, 2),
//           ]),
//       childrenDelegate: SliverChildBuilderDelegate(
//         (context, index) {
//           return Container(
//             height: 200.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.sp),
//               // color: const Color(0xffE6E6E6),
//               // color: Colors.red,
//               color: containerColor,
//             ),
//             child: Column(
//               children: [
//                 Text("tesing"),
//                 Text("tesing"),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: quiltedLayout(context),
    ));
  }

  Widget quiltedLayout(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverQuiltedGridDelegate(
          mainAxisSpacing: 6,
          crossAxisCount: 4,
          crossAxisSpacing: 6,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 2),
            QuiltedGridTile(1, 2),
          ]),
      itemBuilder: (context, index) {
        return Container(
          height: 40,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://source.unsplash.com/random?sig=$index",
                fit: BoxFit.cover,
              )),
        );
      },
      // childrenDelegate:
      //     SliverChildBuilderDelegate(((context, index) => ClipRRect(
      //         borderRadius: BorderRadius.circular(8),
      //         child: Image.network(
      //           "https://source.unsplash.com/random?sig=$index",
      //           fit: BoxFit.cover,
      //         )))),
    );
  }
}
