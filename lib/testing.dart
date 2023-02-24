// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:online_learning_app/core/constants/color.dart';
// import 'package:online_learning_app/core/ui/textStyle.dart';
// import 'package:online_learning_app/features/homepage/models/category_by_id_content.dart';
// import 'package:online_learning_app/features/homepage/respository/category_respository.dart';
// import 'package:online_learning_app/features/homepage/view/homePage.dart';
// import 'package:online_learning_app/features/homepage/view/storyView.dart';
// import 'package:page_transition/page_transition.dart';

// import '../../login/loginPage.dart';
// import '../bloc/catergory_bloc.dart';

// class CoursesList extends StatefulWidget {
//   CoursesList({Key? key, this.isContent}) : super(key: key);
//   bool? isContent;

//   @override
//   State<CoursesList> createState() => _CoursesListState();
// }

// class _CoursesListState extends State<CoursesList> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backGroundColor,
//         // body: Column(
//         //   children: [
//         //     widget.isContent!
//         //         ? Text("${state.categoryModelById.data!.contents!.length}")
//         //         : Text('${state.contentModel.length}')
//         //   ],
//         // ),
//         body: widget.isContent!
//             ? BlocBuilder<CategoryBloc, CategoryState>(
//                 builder: (context, state) {
//                   if (state.contentStatus == CategoryByIdStatus.loading) {
//                     return Center(
//                       child: CircularProgressIndicator(
//                         color: iconColor,
//                       ),
//                     );
//                   } else if (state.contentStatus ==
//                       CategoryByIdStatus.success) {
//                     return Padding(
//                         padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
//                         child: GridView.builder(
//                           gridDelegate: SliverQuiltedGridDelegate(
//                               mainAxisSpacing: 6,
//                               crossAxisCount: 4,
//                               crossAxisSpacing: 6,
//                               repeatPattern: QuiltedGridRepeatPattern.inverted,
//                               pattern: const [
//                                 QuiltedGridTile(2, 2),
//                                 QuiltedGridTile(1, 2),
//                                 QuiltedGridTile(1, 2),
//                               ]),
//                           itemCount:
//                               state.categoryModelById.data!.contents!.length,
//                           itemBuilder: (context, index) {
//                             final contentbyId =
//                                 state.categoryModelById.data!.contents![index];
//                             return index == 1
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       Navigator.of(context).push(
//                                         PageTransition(
//                                             type: PageTransitionType.fade,
//                                             child: LoginPage()),
//                                       );
//                                     },
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(8),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10.sp),
//                                           // color: const Color(0xffE6E6E6),
//                                           color: unselectedColor,
//                                         ),
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 15.sp,
//                                               vertical: 8.sp),
//                                           child: Column(
//                                             children: [
//                                               Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Text('Login',
//                                                     style: textStyle(
//                                                         fontSize: 10.sp,
//                                                         color: white,
//                                                         fontWeight:
//                                                             FontWeight.w600)),
//                                               ),
//                                               SizedBox(
//                                                 height: 6.h,
//                                               ),
//                                               Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Text(
//                                                     'Login for dashboard',
//                                                     textAlign: TextAlign.left,
//                                                     overflow: TextOverflow.fade,
//                                                     style: textStyle(
//                                                         fontSize: 15.sp,
//                                                         color: white,
//                                                         fontWeight:
//                                                             FontWeight.bold)),
//                                               ),
//                                               SizedBox(
//                                                 height: 6.h,
//                                               ),
//                                               Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Text(
//                                                     'Give you access to premium content',
//                                                     style: textStyle(
//                                                         fontSize: 8.sp,
//                                                         letterSpacing: 1,
//                                                         color: white,
//                                                         fontWeight:
//                                                             FontWeight.w600)),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 : GestureDetector(
//                                     onTap: () async {
//                                       setState(() {
//                                         context.read<CategoryBloc>().add(
//                                             FetchCategoryByIdContentEvent(
//                                                 contentbyId.id!));
//                                         if (state.categoryByIdContentStatus ==
//                                             CategoryByIdContentStatus.success) {
//                                           Navigator.push(context,
//                                               MaterialPageRoute(
//                                                   builder: (context) {
//                                             return StoryViewPage(
//                                                 content: state
//                                                     .categoryByIdContent
//                                                     .data!
//                                                     .typeDescriptions!);
//                                           }));
//                                         } else if (state
//                                                 .categoryByIdContentStatus ==
//                                             CategoryByIdContentStatus.loading) {
//                                           Center(
//                                             child: CircularProgressIndicator(
//                                                 color: iconColor),
//                                           );
//                                         }
//                                       });
//                                     },
//                                     child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(8),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10.sp),
//                                             // color: const Color(0xffE6E6E6),
//                                             color: containerColor,
//                                           ),
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 15.sp,
//                                                 vertical: 10.sp),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Align(
//                                                   alignment: Alignment.topLeft,
//                                                   child: Text(
//                                                       // isContent
//                                                       //     ?
//                                                       '${contentbyId.title}',
//                                                       // : '${state.categoryModelById.data!.name}',
//                                                       textAlign: TextAlign.left,
//                                                       overflow:
//                                                           TextOverflow.fade,
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           color: textColor,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                 ),
//                                                 Align(
//                                                   alignment: Alignment.topLeft,
//                                                   child: Text(
//                                                       // isContent
//                                                       //     ?
//                                                       '${contentbyId.excerpt}',
//                                                       // : '${state.categoryModelById.data!.description}',
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       maxLines: 3,
//                                                       style: TextStyle(
//                                                           fontSize: 10.sp,
//                                                           color: textColor,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         )),
//                                   );
//                           },
//                         ));
//                   } else {
//                     return Container();
//                   }
//                 },
//               )
//             : BlocBuilder<CategoryBloc, CategoryState>(
//                 // listener: (context, state) {
//                 //   if (state.categoryByIdContentStatus ==
//                 //       CategoryByIdContentStatus.loading) {
//                 //     Center(
//                 //       child: CircularProgressIndicator(
//                 //         color: iconColor,
//                 //       ),
//                 //     );
//                 //   } else if (state.categoryByIdContentStatus ==
//                 //       CategoryByIdContentStatus.success) {
//                 //     Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 //       return StoryViewPage(
//                 //           content: state.categoryByIdContent.data!.typeDescriptions!);
//                 //     }));
//                 //   }
//                 // },
//                 builder: (context, state) {
//                   if (state.categoryByIdStatus == ContentStatus.loading) {
//                     return Center(
//                       child: CircularProgressIndicator(
//                         color: iconColor,
//                       ),
//                     );
//                   } else if (state.categoryByIdStatus ==
//                       ContentStatus.failure) {
//                     return const Center(
//                       child: Text('Something went Wrong'),
//                     );
//                   } else if (state.categoryByIdStatus ==
//                       ContentStatus.success) {
//                     return Padding(
//                         padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
//                         child: GridView.builder(
//                           gridDelegate: SliverQuiltedGridDelegate(
//                               mainAxisSpacing: 6,
//                               crossAxisCount: 4,
//                               crossAxisSpacing: 6,
//                               repeatPattern: QuiltedGridRepeatPattern.inverted,
//                               pattern: const [
//                                 QuiltedGridTile(2, 2),
//                                 QuiltedGridTile(1, 2),
//                                 QuiltedGridTile(1, 2),
//                               ]),
//                           itemCount: state.contentModel.length,
//                           // : state.categoryModelById.data!.contents!.length,
//                           itemBuilder: (context, index) {
//                             final content = state.contentModel[index];
//                             return index == 1
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       Navigator.of(context).push(
//                                         PageTransition(
//                                             type: PageTransitionType.fade,
//                                             child: LoginPage()),
//                                       );
//                                     },
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(8),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10.sp),
//                                           // color: const Color(0xffE6E6E6),
//                                           color: unselectedColor,
//                                         ),
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 15.sp,
//                                               vertical: 8.sp),
//                                           child: Column(
//                                             children: [
//                                               Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Text('Login',
//                                                     style: textStyle(
//                                                         fontSize: 10.sp,
//                                                         color: white,
//                                                         fontWeight:
//                                                             FontWeight.w600)),
//                                               ),
//                                               SizedBox(
//                                                 height: 6.h,
//                                               ),
//                                               Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Text(
//                                                     'Login for dashboard',
//                                                     textAlign: TextAlign.left,
//                                                     overflow: TextOverflow.fade,
//                                                     style: textStyle(
//                                                         fontSize: 15.sp,
//                                                         color: white,
//                                                         fontWeight:
//                                                             FontWeight.bold)),
//                                               ),
//                                               SizedBox(
//                                                 height: 6.h,
//                                               ),
//                                               Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Text(
//                                                     'Give you access to premium content',
//                                                     style: textStyle(
//                                                         fontSize: 8.sp,
//                                                         letterSpacing: 1,
//                                                         color: white,
//                                                         fontWeight:
//                                                             FontWeight.w600)),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 : ClipRRect(
//                                     borderRadius: BorderRadius.circular(8),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(10.sp),
//                                         // color: const Color(0xffE6E6E6),
//                                         color: containerColor,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 15.sp, vertical: 10.sp),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text(
//                                                   // isContent
//                                                   //     ?
//                                                   '${content.title}',
//                                                   // : '${state.categoryModelById.data!.name}',
//                                                   textAlign: TextAlign.left,
//                                                   overflow: TextOverflow.fade,
//                                                   style: TextStyle(
//                                                       fontSize: 15,
//                                                       color: textColor,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                             ),
//                                             Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text('${content.excerpt}',
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   maxLines: 2,
//                                                   style: TextStyle(
//                                                       fontSize: 10.sp,
//                                                       color: textColor,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ));
//                           },
//                         )
//                         // child: ListView.builder(
//                         //   itemCount: state.contentModel.data!.contents!.length,
//                         //   itemBuilder: (context, index) {
//                         //     final content = state.contentModel.data!.contents![index];
//                         //     return Column(
//                         //       children: [
//                         //         Row(
//                         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //           children: [
//                         //             GestureDetector(
//                         //               onTap: () {
//                         //                 Navigator.of(context).push(
//                         //                   PageTransition(
//                         //                       type: PageTransitionType.leftToRight,
//                         //                       child: StoryViewPage(
//                         //                         stories: stories,
//                         //                         name: 'ScanSkill',
//                         //                       )),
//                         //                 );
//                         //               },
//                         //               child: Container(
//                         //                 width: 175.w,
//                         //                 height: 250.h,
//                         //                 decoration: BoxDecoration(
//                         //                   borderRadius: BorderRadius.circular(10.sp),
//                         //                   // color: const Color(0xffE6E6E6),
//                         //                   color: containerColor,
//                         //                 ),
//                         //                 child: Padding(
//                         //                   padding: EdgeInsets.symmetric(
//                         //                       horizontal: 15.sp, vertical: 10.sp),
//                         //                   child: Column(
//                         //                     children: [
//                         //                       SizedBox(
//                         //                         height: 5.h,
//                         //                       ),
//                         //                       Stack(
//                         //                         children: [
//                         //                           Container(
//                         //                             height: 6,
//                         //                             margin:
//                         //                                 const EdgeInsets.only(top: 4),
//                         //                             width: double.infinity,
//                         //                             decoration: BoxDecoration(
//                         //                                 color: Color.fromARGB(
//                         //                                     255, 203, 202, 207),
//                         //                                 borderRadius:
//                         //                                     BorderRadius.circular(50)),
//                         //                             child: Text(''),
//                         //                           ),
//                         //                           Container(
//                         //                             height: 6,
//                         //                             margin:
//                         //                                 const EdgeInsets.only(top: 4),
//                         //                             width: 64,
//                         //                             decoration: BoxDecoration(
//                         //                                 color: progressBarColor,
//                         //                                 borderRadius:
//                         //                                     BorderRadius.circular(50)),
//                         //                           ),
//                         //                         ],
//                         //                       ),
//                         //                       SizedBox(
//                         //                         height: 4.h,
//                         //                       ),
//                         //                       Align(
//                         //                         alignment: Alignment.topLeft,
//                         //                         child: Text(
//                         //                           'Introduction',
//                         //                           style: textStyle(
//                         //                             fontSize: 9.sp,
//                         //                             fontWeight: FontWeight.w600,
//                         //                             color: textColor,
//                         //                           ),
//                         //                         ),
//                         //                       ),
//                         //                       SizedBox(
//                         //                         height: 10.h,
//                         //                       ),
//                         //                       Align(
//                         //                         alignment: Alignment.topLeft,
//                         //                         child: Container(
//                         //                           width: 50.w,
//                         //                           height: 45.h,
//                         //                           decoration: BoxDecoration(
//                         //                             borderRadius:
//                         //                                 BorderRadius.circular(8),
//                         //                             color: textColor,
//                         //                           ),
//                         //                           child: Icon(
//                         //                             FontAwesomeIcons.ghost,
//                         //                             color: iconColor,
//                         //                           ),
//                         //                         ),
//                         //                       ),
//                         //                       SizedBox(
//                         //                         height: 8.h,
//                         //                       ),
//                         //                       Align(
//                         //                         alignment: Alignment.topLeft,
//                         //                         child: Text(
//                         //                           'What is ${content.title}',
//                         //                           style: TextStyle(
//                         //                               color: textColor,
//                         //                               fontSize: 20.sp,
//                         //                               fontWeight: FontWeight.bold),
//                         //                         ),
//                         //                       ),
//                         //                       SizedBox(
//                         //                         height: 6.h,
//                         //                       ),
//                         //                       Align(
//                         //                         alignment: Alignment.topLeft,
//                         //                         child: Column(
//                         //                           children: [
//                         //                             Text(
//                         //                               '${content.title} is widely\nused program\ndynamic websites',
//                         //                               overflow: TextOverflow.fade,
//                         //                               style: textStyle(
//                         //                                 color: textColor,
//                         //                                 fontSize: 11.sp,
//                         //                                 letterSpacing: 1,
//                         //                                 fontWeight: FontWeight.bold,
//                         //                               ),
//                         //                             ),
//                         //                           ],
//                         //                         ),
//                         //                       ),
//                         //                       Row(
//                         //                         mainAxisAlignment:
//                         //                             MainAxisAlignment.spaceBetween,
//                         //                         children: [
//                         //                           Text(
//                         //                             "30 min",
//                         //                             style: textStyle(
//                         //                               fontSize: 9.sp,
//                         //                               fontWeight: FontWeight.w600,
//                         //                               color: textColor,
//                         //                             ),
//                         //                           ),
//                         //                           IconButton(
//                         //                               onPressed: () async {
//                         //                                 Navigator.of(context).push(
//                         //                                   PageTransition(
//                         //                                       type: PageTransitionType
//                         //                                           .leftToRight,
//                         //                                       child: StoryViewPage(
//                         //                                         stories: stories,
//                         //                                         name: 'ScanSkill',
//                         //                                       )),
//                         //                                 );
//                         //                               },
//                         //                               icon: Icon(
//                         //                                 Icons.arrow_forward,
//                         //                                 color: iconColor,
//                         //                               ))
//                         //                         ],
//                         //                       )
//                         //                     ],
//                         //                   ),
//                         //                 ),
//                         //               ),
//                         //             ),
//                         //             Container(
//                         //               width: 175.w,
//                         //               height: 250.h,
//                         //               decoration: BoxDecoration(
//                         //                 borderRadius: BorderRadius.circular(10.sp),
//                         //                 // color: const Color(0xffE6E6E6),
//                         //                 // color: Colors.red,
//                         //               ),
//                         //               child: Column(
//                         //                 children: [
//                         //                   GestureDetector(
//                         //                     onTap: () {
//                         //                       Navigator.of(context).push(
//                         //                         PageTransition(
//                         //                             type:
//                         //                                 PageTransitionType.leftToRight,
//                         //                             child: LoginPage()),
//                         //                       );
//                         //                     },
//                         //                     child: Container(
//                         //                       width: double.infinity,
//                         //                       height: 120.h,
//                         //                       decoration: BoxDecoration(
//                         //                         borderRadius:
//                         //                             BorderRadius.circular(10.sp),
//                         //                         // color: const Color(0xffE6E6E6),
//                         //                         color: unselectedColor,
//                         //                       ),
//                         //                       child: Padding(
//                         //                         padding: EdgeInsets.symmetric(
//                         //                             horizontal: 15.sp, vertical: 8.sp),
//                         //                         child: Column(
//                         //                           children: [
//                         //                             SizedBox(
//                         //                               height: 5.h,
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Text(
//                         //                                 'Login',
//                         //                                 style: textStyle(
//                         //                                   fontSize: 10.sp,
//                         //                                   fontWeight: FontWeight.w600,
//                         //                                   color: white,
//                         //                                 ),
//                         //                               ),
//                         //                             ),
//                         //                             SizedBox(
//                         //                               height: 6.h,
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Text(
//                         //                                   'Login for \nDashbord',
//                         //                                   style: TextStyle(
//                         //                                       color: white,
//                         //                                       fontSize: 15,
//                         //                                       fontWeight:
//                         //                                           FontWeight.bold)),
//                         //                             ),
//                         //                             SizedBox(
//                         //                               height: 5.h,
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Column(
//                         //                                 children: [
//                         //                                   Text(
//                         //                                     'Give you access to premium content',
//                         //                                     style: textStyle(
//                         //                                       color: white,
//                         //                                       fontSize: 10.sp,
//                         //                                       letterSpacing: 1,
//                         //                                       fontWeight:
//                         //                                           FontWeight.bold,
//                         //                                     ),
//                         //                                   ),
//                         //                                 ],
//                         //                               ),
//                         //                             ),
//                         //                           ],
//                         //                         ),
//                         //                       ),
//                         //                     ),
//                         //                   ),
//                         //                   SizedBox(
//                         //                     height: 10.h,
//                         //                   ),
//                         //                   GestureDetector(
//                         //                     onTap: () {
//                         //                       Navigator.push(
//                         //                           context,
//                         //                           MaterialPageRoute(
//                         //                               builder: (context) =>
//                         //                                   StoryViewPage(
//                         //                                     stories: stories,
//                         //                                     name: 'ScanSkill',
//                         //                                   )));
//                         //                     },
//                         //                     child: Container(
//                         //                       width: double.infinity,
//                         //                       height: 120.h,
//                         //                       decoration: BoxDecoration(
//                         //                         borderRadius:
//                         //                             BorderRadius.circular(10.sp),
//                         //                         // color: const Color(0xffE6E6E6),
//                         //                         color: containerColor,
//                         //                       ),
//                         //                       child: Padding(
//                         //                         padding: EdgeInsets.symmetric(
//                         //                             horizontal: 15.sp, vertical: 10.sp),
//                         //                         child: Column(
//                         //                           children: [
//                         //                             SizedBox(
//                         //                               height: 5.h,
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Text(
//                         //                                 'VLOG',
//                         //                                 style: textStyle(
//                         //                                   fontSize: 9.sp,
//                         //                                   fontWeight: FontWeight.w600,
//                         //                                   color: textColor,
//                         //                                 ),
//                         //                               ),
//                         //                             ),
//                         //                             SizedBox(
//                         //                               height: 6.h,
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Text(
//                         //                                   'Learn ${content.title}\nFrameWork',
//                         //                                   style: TextStyle(
//                         //                                       fontSize: 15,
//                         //                                       color: textColor,
//                         //                                       fontWeight:
//                         //                                           FontWeight.bold)),
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Column(
//                         //                                 children: [
//                         //                                   Text(
//                         //                                     'widely used program dynamic websites',
//                         //                                     style: textStyle(
//                         //                                       fontSize: 10.sp,
//                         //                                       color: textColor,
//                         //                                       letterSpacing: 1,
//                         //                                       fontWeight:
//                         //                                           FontWeight.bold,
//                         //                                     ),
//                         //                                   ),
//                         //                                 ],
//                         //                               ),
//                         //                             ),
//                         //                           ],
//                         //                         ),
//                         //                       ),
//                         //                     ),
//                         //                   ),
//                         //                 ],
//                         //               ),
//                         //             ),
//                         //           ],
//                         //         ),
//                         //         SizedBox(
//                         //           height: 10.h,
//                         //         ),
//                         //         Row(
//                         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //           children: [
//                         //             Container(
//                         //               width: 175.w,
//                         //               height: 250.h,
//                         //               decoration: BoxDecoration(
//                         //                 borderRadius: BorderRadius.circular(10.sp),
//                         //               ),
//                         //               child: Column(
//                         //                 children: [
//                         //                   Container(
//                         //                     width: double.infinity,
//                         //                     height: 120.h,
//                         //                     decoration: BoxDecoration(
//                         //                       borderRadius:
//                         //                           BorderRadius.circular(10.sp),
//                         //                       color: containerColor,
//                         //                     ),
//                         //                     child: Padding(
//                         //                       padding: EdgeInsets.symmetric(
//                         //                           horizontal: 15.sp, vertical: 10.sp),
//                         //                       child: Column(
//                         //                         children: [
//                         //                           SizedBox(
//                         //                             height: 5.h,
//                         //                           ),
//                         //                           Align(
//                         //                             alignment: Alignment.topLeft,
//                         //                             child: Text(
//                         //                               'Articles',
//                         //                               style: textStyle(
//                         //                                 fontSize: 10.sp,
//                         //                                 fontWeight: FontWeight.w600,
//                         //                                 color: textColor,
//                         //                               ),
//                         //                             ),
//                         //                           ),
//                         //                           SizedBox(
//                         //                             height: 5.h,
//                         //                           ),
//                         //                           Align(
//                         //                             alignment: Alignment.topLeft,
//                         //                             child: Text(
//                         //                                 'Tips for better\n${content.title}',
//                         //                                 style: TextStyle(
//                         //                                     color: textColor,
//                         //                                     fontSize: 15,
//                         //                                     fontWeight:
//                         //                                         FontWeight.bold)),
//                         //                           ),
//                         //                           SizedBox(
//                         //                             height: 5.h,
//                         //                           ),
//                         //                           Align(
//                         //                             alignment: Alignment.topLeft,
//                         //                             child: Column(
//                         //                               children: [
//                         //                                 Text(
//                         //                                   '${content.title} is widely used program dynamic websites',
//                         //                                   style: textStyle(
//                         //                                     color: textColor,
//                         //                                     fontSize: 10.sp,
//                         //                                     letterSpacing: 1,
//                         //                                     fontWeight: FontWeight.bold,
//                         //                                   ),
//                         //                                 ),
//                         //                               ],
//                         //                             ),
//                         //                           ),
//                         //                         ],
//                         //                       ),
//                         //                     ),
//                         //                   ),
//                         //                   SizedBox(
//                         //                     height: 10.h,
//                         //                   ),
//                         //                   GestureDetector(
//                         //                     onTap: () {},
//                         //                     child: Container(
//                         //                       width: double.infinity,
//                         //                       height: 120.h,
//                         //                       decoration: BoxDecoration(
//                         //                         borderRadius:
//                         //                             BorderRadius.circular(10.sp),
//                         //                         // color: const Color(0xffE6E6E6),
//                         //                         color: containerColor,
//                         //                       ),
//                         //                       child: Padding(
//                         //                         padding: EdgeInsets.symmetric(
//                         //                             horizontal: 15.sp, vertical: 10.sp),
//                         //                         child: Column(
//                         //                           children: [
//                         //                             SizedBox(
//                         //                               height: 5.h,
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Text(
//                         //                                 'VLOG',
//                         //                                 style: textStyle(
//                         //                                   fontSize: 9.sp,
//                         //                                   fontWeight: FontWeight.w600,
//                         //                                   color: textColor,
//                         //                                 ),
//                         //                               ),
//                         //                             ),
//                         //                             SizedBox(
//                         //                               height: 6.h,
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Text(
//                         //                                   'Learn${content.title} FrameWork',
//                         //                                   style: TextStyle(
//                         //                                       color: textColor,
//                         //                                       fontSize: 15,
//                         //                                       fontWeight:
//                         //                                           FontWeight.bold)),
//                         //                             ),
//                         //                             Align(
//                         //                               alignment: Alignment.topLeft,
//                         //                               child: Column(
//                         //                                 children: [
//                         //                                   Text(
//                         //                                     'widely used program dynamic websites',
//                         //                                     style: textStyle(
//                         //                                       fontSize: 10.sp,
//                         //                                       letterSpacing: 1,
//                         //                                       fontWeight:
//                         //                                           FontWeight.bold,
//                         //                                     ),
//                         //                                   ),
//                         //                                 ],
//                         //                               ),
//                         //                             ),
//                         //                           ],
//                         //                         ),
//                         //                       ),
//                         //                     ),
//                         //                   ),
//                         //                 ],
//                         //               ),
//                         //             ),
//                         //             Container(
//                         //               width: 175.w,
//                         //               height: 250.h,
//                         //               decoration: BoxDecoration(
//                         //                 borderRadius: BorderRadius.circular(10.sp),
//                         //                 // color: const Color(0xffE6E6E6),
//                         //                 color: containerColor,
//                         //               ),
//                         //               child: Padding(
//                         //                 padding: EdgeInsets.symmetric(
//                         //                     horizontal: 15.sp, vertical: 10.sp),
//                         //                 child: Column(
//                         //                   children: [
//                         //                     SizedBox(
//                         //                       height: 5.h,
//                         //                     ),
//                         //                     Stack(
//                         //                       children: [
//                         //                         Container(
//                         //                           height: 6,
//                         //                           margin: const EdgeInsets.only(top: 4),
//                         //                           width: double.infinity,
//                         //                           decoration: BoxDecoration(
//                         //                               color: Color.fromARGB(
//                         //                                   255, 203, 202, 207),
//                         //                               borderRadius:
//                         //                                   BorderRadius.circular(50)),
//                         //                           child: Text(''),
//                         //                         ),
//                         //                         Container(
//                         //                           height: 6,
//                         //                           margin: const EdgeInsets.only(top: 4),
//                         //                           width: 64,
//                         //                           decoration: BoxDecoration(
//                         //                               color: progressBarColor,
//                         //                               borderRadius:
//                         //                                   BorderRadius.circular(50)),
//                         //                         ),
//                         //                       ],
//                         //                     ),
//                         //                     SizedBox(
//                         //                       height: 4.h,
//                         //                     ),
//                         //                     Align(
//                         //                       alignment: Alignment.topLeft,
//                         //                       child: Text(
//                         //                         'Introduction',
//                         //                         style: textStyle(
//                         //                           fontSize: 9.sp,
//                         //                           fontWeight: FontWeight.w600,
//                         //                           color: textColor,
//                         //                         ),
//                         //                       ),
//                         //                     ),
//                         //                     SizedBox(
//                         //                       height: 10.h,
//                         //                     ),
//                         //                     Align(
//                         //                       alignment: Alignment.topLeft,
//                         //                       child: Container(
//                         //                         width: 50.w,
//                         //                         height: 45.h,
//                         //                         decoration: BoxDecoration(
//                         //                           borderRadius:
//                         //                               BorderRadius.circular(8),
//                         //                           color: textColor,
//                         //                         ),
//                         //                         child: Icon(
//                         //                           FontAwesomeIcons.ghost,
//                         //                           color: iconColor,
//                         //                         ),
//                         //                       ),
//                         //                     ),
//                         //                     SizedBox(
//                         //                       height: 8.h,
//                         //                     ),
//                         //                     Align(
//                         //                       alignment: Alignment.topLeft,
//                         //                       child: Text(
//                         //                         'What is ${content.title}?',
//                         //                         style: TextStyle(
//                         //                             color: textColor,
//                         //                             fontSize: 20.sp,
//                         //                             fontWeight: FontWeight.bold),
//                         //                       ),
//                         //                     ),
//                         //                     SizedBox(
//                         //                       height: 6.h,
//                         //                     ),
//                         //                     Align(
//                         //                       alignment: Alignment.topLeft,
//                         //                       child: Column(
//                         //                         children: [
//                         //                           Text(
//                         //                             '${content.title} is widely\nused program\ndynamic websites',
//                         //                             style: textStyle(
//                         //                               fontSize: 11.sp,
//                         //                               color: textColor,
//                         //                               letterSpacing: 1,
//                         //                               fontWeight: FontWeight.bold,
//                         //                             ),
//                         //                           ),
//                         //                         ],
//                         //                       ),
//                         //                     ),
//                         //                     Row(
//                         //                       mainAxisAlignment:
//                         //                           MainAxisAlignment.spaceBetween,
//                         //                       children: [
//                         //                         Text(
//                         //                           "30 min",
//                         //                           style: textStyle(
//                         //                             fontSize: 9.sp,
//                         //                             fontWeight: FontWeight.w600,
//                         //                             color: textColor,
//                         //                           ),
//                         //                         ),
//                         //                         IconButton(
//                         //                             onPressed: () {},
//                         //                             icon: Icon(
//                         //                               Icons.arrow_forward,
//                         //                               color: iconColor,
//                         //                             ))
//                         //                       ],
//                         //                     )
//                         //                   ],
//                         //                 ),
//                         //               ),
//                         //             ),
//                         //           ],
//                         //         ),
//                         //         SizedBox(
//                         //           height: 10.h,
//                         //         ),
//                         //       ],
//                         //     );
//                         //   },
//                         // ),
//                         );
//                   } else {
//                     return Container();
//                   }
//                 },
//               ),
//       ),
//     );
//   }
// }
