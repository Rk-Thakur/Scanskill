import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/features/homepage/models/category_id_model.dart';

import '../../login/loginPage.dart';
import '../bloc/catergory_bloc.dart';

class CoursesList extends StatefulWidget {
  CoursesList({Key? key, this.categoryModelById}) : super(key: key);
  CategoryModelById? categoryModelById;

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  @override
  void initState() {
    // CategoryRepository().fetchCategoryById(widget.categoryModelById!.data!.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = 'unauthorized';
    // final state = context.watch<CategoryBloc>().state;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state.categoryStatus == CategoryStatus.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: iconColor,
                ),
              );
            } else if (state.categoryStatus == CategoryStatus.success) {
              return Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: GridView.builder(
                    gridDelegate: SliverQuiltedGridDelegate(
                        mainAxisSpacing: 6,
                        crossAxisCount: 4,
                        crossAxisSpacing: 6,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: const [
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 2),
                          QuiltedGridTile(1, 2),
                        ]),
                    itemCount: state.contentModel.length,
                    itemBuilder: (context, index) {
                      final content = state.contentModel[index];
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              // color: const Color(0xffE6E6E6),
                              color: containerColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.sp, vertical: 10.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('${content.title}',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: textColor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('${content.description}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: textColor,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ));
                    },
                  )
                  // child: ListView.builder(
                  //   itemCount: state.contentModel.data!.contents!.length,
                  //   itemBuilder: (context, index) {
                  //     final content = state.contentModel.data!.contents![index];
                  //     return Column(
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             GestureDetector(
                  //               onTap: () {
                  //                 Navigator.of(context).push(
                  //                   PageTransition(
                  //                       type: PageTransitionType.leftToRight,
                  //                       child: StoryViewPage(
                  //                         stories: stories,
                  //                         name: 'ScanSkill',
                  //                       )),
                  //                 );
                  //               },
                  //               child: Container(
                  //                 width: 175.w,
                  //                 height: 250.h,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(10.sp),
                  //                   // color: const Color(0xffE6E6E6),
                  //                   color: containerColor,
                  //                 ),
                  //                 child: Padding(
                  //                   padding: EdgeInsets.symmetric(
                  //                       horizontal: 15.sp, vertical: 10.sp),
                  //                   child: Column(
                  //                     children: [
                  //                       SizedBox(
                  //                         height: 5.h,
                  //                       ),
                  //                       Stack(
                  //                         children: [
                  //                           Container(
                  //                             height: 6,
                  //                             margin:
                  //                                 const EdgeInsets.only(top: 4),
                  //                             width: double.infinity,
                  //                             decoration: BoxDecoration(
                  //                                 color: Color.fromARGB(
                  //                                     255, 203, 202, 207),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(50)),
                  //                             child: Text(''),
                  //                           ),
                  //                           Container(
                  //                             height: 6,
                  //                             margin:
                  //                                 const EdgeInsets.only(top: 4),
                  //                             width: 64,
                  //                             decoration: BoxDecoration(
                  //                                 color: progressBarColor,
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(50)),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         height: 4.h,
                  //                       ),
                  //                       Align(
                  //                         alignment: Alignment.topLeft,
                  //                         child: Text(
                  //                           'Introduction',
                  //                           style: textStyle(
                  //                             fontSize: 9.sp,
                  //                             fontWeight: FontWeight.w600,
                  //                             color: textColor,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 10.h,
                  //                       ),
                  //                       Align(
                  //                         alignment: Alignment.topLeft,
                  //                         child: Container(
                  //                           width: 50.w,
                  //                           height: 45.h,
                  //                           decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(8),
                  //                             color: textColor,
                  //                           ),
                  //                           child: Icon(
                  //                             FontAwesomeIcons.ghost,
                  //                             color: iconColor,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 8.h,
                  //                       ),
                  //                       Align(
                  //                         alignment: Alignment.topLeft,
                  //                         child: Text(
                  //                           'What is ${content.title}',
                  //                           style: TextStyle(
                  //                               color: textColor,
                  //                               fontSize: 20.sp,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 6.h,
                  //                       ),
                  //                       Align(
                  //                         alignment: Alignment.topLeft,
                  //                         child: Column(
                  //                           children: [
                  //                             Text(
                  //                               '${content.title} is widely\nused program\ndynamic websites',
                  //                               overflow: TextOverflow.fade,
                  //                               style: textStyle(
                  //                                 color: textColor,
                  //                                 fontSize: 11.sp,
                  //                                 letterSpacing: 1,
                  //                                 fontWeight: FontWeight.bold,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           Text(
                  //                             "30 min",
                  //                             style: textStyle(
                  //                               fontSize: 9.sp,
                  //                               fontWeight: FontWeight.w600,
                  //                               color: textColor,
                  //                             ),
                  //                           ),
                  //                           IconButton(
                  //                               onPressed: () async {
                  //                                 Navigator.of(context).push(
                  //                                   PageTransition(
                  //                                       type: PageTransitionType
                  //                                           .leftToRight,
                  //                                       child: StoryViewPage(
                  //                                         stories: stories,
                  //                                         name: 'ScanSkill',
                  //                                       )),
                  //                                 );
                  //                               },
                  //                               icon: Icon(
                  //                                 Icons.arrow_forward,
                  //                                 color: iconColor,
                  //                               ))
                  //                         ],
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               width: 175.w,
                  //               height: 250.h,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10.sp),
                  //                 // color: const Color(0xffE6E6E6),
                  //                 // color: Colors.red,
                  //               ),
                  //               child: Column(
                  //                 children: [
                  //                   GestureDetector(
                  //                     onTap: () {
                  //                       Navigator.of(context).push(
                  //                         PageTransition(
                  //                             type:
                  //                                 PageTransitionType.leftToRight,
                  //                             child: LoginPage()),
                  //                       );
                  //                     },
                  //                     child: Container(
                  //                       width: double.infinity,
                  //                       height: 120.h,
                  //                       decoration: BoxDecoration(
                  //                         borderRadius:
                  //                             BorderRadius.circular(10.sp),
                  //                         // color: const Color(0xffE6E6E6),
                  //                         color: unselectedColor,
                  //                       ),
                  //                       child: Padding(
                  //                         padding: EdgeInsets.symmetric(
                  //                             horizontal: 15.sp, vertical: 8.sp),
                  //                         child: Column(
                  //                           children: [
                  //                             SizedBox(
                  //                               height: 5.h,
                  //                             ),
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Text(
                  //                                 'Login',
                  //                                 style: textStyle(
                  //                                   fontSize: 10.sp,
                  //                                   fontWeight: FontWeight.w600,
                  //                                   color: white,
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             SizedBox(
                  //                               height: 6.h,
                  //                             ),
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Text(
                  //                                   'Login for \nDashbord',
                  //                                   style: TextStyle(
                  //                                       color: white,
                  //                                       fontSize: 15,
                  //                                       fontWeight:
                  //                                           FontWeight.bold)),
                  //                             ),
                  //                             SizedBox(
                  //                               height: 5.h,
                  //                             ),
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Column(
                  //                                 children: [
                  //                                   Text(
                  //                                     'Give you access to premium content',
                  //                                     style: textStyle(
                  //                                       color: white,
                  //                                       fontSize: 10.sp,
                  //                                       letterSpacing: 1,
                  //                                       fontWeight:
                  //                                           FontWeight.bold,
                  //                                     ),
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 10.h,
                  //                   ),
                  //                   GestureDetector(
                  //                     onTap: () {
                  //                       Navigator.push(
                  //                           context,
                  //                           MaterialPageRoute(
                  //                               builder: (context) =>
                  //                                   StoryViewPage(
                  //                                     stories: stories,
                  //                                     name: 'ScanSkill',
                  //                                   )));
                  //                     },
                  //                     child: Container(
                  //                       width: double.infinity,
                  //                       height: 120.h,
                  //                       decoration: BoxDecoration(
                  //                         borderRadius:
                  //                             BorderRadius.circular(10.sp),
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
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Text(
                  //                                 'VLOG',
                  //                                 style: textStyle(
                  //                                   fontSize: 9.sp,
                  //                                   fontWeight: FontWeight.w600,
                  //                                   color: textColor,
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             SizedBox(
                  //                               height: 6.h,
                  //                             ),
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Text(
                  //                                   'Learn ${content.title}\nFrameWork',
                  //                                   style: TextStyle(
                  //                                       fontSize: 15,
                  //                                       color: textColor,
                  //                                       fontWeight:
                  //                                           FontWeight.bold)),
                  //                             ),
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Column(
                  //                                 children: [
                  //                                   Text(
                  //                                     'widely used program dynamic websites',
                  //                                     style: textStyle(
                  //                                       fontSize: 10.sp,
                  //                                       color: textColor,
                  //                                       letterSpacing: 1,
                  //                                       fontWeight:
                  //                                           FontWeight.bold,
                  //                                     ),
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           height: 10.h,
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Container(
                  //               width: 175.w,
                  //               height: 250.h,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10.sp),
                  //               ),
                  //               child: Column(
                  //                 children: [
                  //                   Container(
                  //                     width: double.infinity,
                  //                     height: 120.h,
                  //                     decoration: BoxDecoration(
                  //                       borderRadius:
                  //                           BorderRadius.circular(10.sp),
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
                  //                           Align(
                  //                             alignment: Alignment.topLeft,
                  //                             child: Text(
                  //                               'Articles',
                  //                               style: textStyle(
                  //                                 fontSize: 10.sp,
                  //                                 fontWeight: FontWeight.w600,
                  //                                 color: textColor,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           SizedBox(
                  //                             height: 5.h,
                  //                           ),
                  //                           Align(
                  //                             alignment: Alignment.topLeft,
                  //                             child: Text(
                  //                                 'Tips for better\n${content.title}',
                  //                                 style: TextStyle(
                  //                                     color: textColor,
                  //                                     fontSize: 15,
                  //                                     fontWeight:
                  //                                         FontWeight.bold)),
                  //                           ),
                  //                           SizedBox(
                  //                             height: 5.h,
                  //                           ),
                  //                           Align(
                  //                             alignment: Alignment.topLeft,
                  //                             child: Column(
                  //                               children: [
                  //                                 Text(
                  //                                   '${content.title} is widely used program dynamic websites',
                  //                                   style: textStyle(
                  //                                     color: textColor,
                  //                                     fontSize: 10.sp,
                  //                                     letterSpacing: 1,
                  //                                     fontWeight: FontWeight.bold,
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 10.h,
                  //                   ),
                  //                   GestureDetector(
                  //                     onTap: () {},
                  //                     child: Container(
                  //                       width: double.infinity,
                  //                       height: 120.h,
                  //                       decoration: BoxDecoration(
                  //                         borderRadius:
                  //                             BorderRadius.circular(10.sp),
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
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Text(
                  //                                 'VLOG',
                  //                                 style: textStyle(
                  //                                   fontSize: 9.sp,
                  //                                   fontWeight: FontWeight.w600,
                  //                                   color: textColor,
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             SizedBox(
                  //                               height: 6.h,
                  //                             ),
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Text(
                  //                                   'Learn${content.title} FrameWork',
                  //                                   style: TextStyle(
                  //                                       color: textColor,
                  //                                       fontSize: 15,
                  //                                       fontWeight:
                  //                                           FontWeight.bold)),
                  //                             ),
                  //                             Align(
                  //                               alignment: Alignment.topLeft,
                  //                               child: Column(
                  //                                 children: [
                  //                                   Text(
                  //                                     'widely used program dynamic websites',
                  //                                     style: textStyle(
                  //                                       fontSize: 10.sp,
                  //                                       letterSpacing: 1,
                  //                                       fontWeight:
                  //                                           FontWeight.bold,
                  //                                     ),
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Container(
                  //               width: 175.w,
                  //               height: 250.h,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10.sp),
                  //                 // color: const Color(0xffE6E6E6),
                  //                 color: containerColor,
                  //               ),
                  //               child: Padding(
                  //                 padding: EdgeInsets.symmetric(
                  //                     horizontal: 15.sp, vertical: 10.sp),
                  //                 child: Column(
                  //                   children: [
                  //                     SizedBox(
                  //                       height: 5.h,
                  //                     ),
                  //                     Stack(
                  //                       children: [
                  //                         Container(
                  //                           height: 6,
                  //                           margin: const EdgeInsets.only(top: 4),
                  //                           width: double.infinity,
                  //                           decoration: BoxDecoration(
                  //                               color: Color.fromARGB(
                  //                                   255, 203, 202, 207),
                  //                               borderRadius:
                  //                                   BorderRadius.circular(50)),
                  //                           child: Text(''),
                  //                         ),
                  //                         Container(
                  //                           height: 6,
                  //                           margin: const EdgeInsets.only(top: 4),
                  //                           width: 64,
                  //                           decoration: BoxDecoration(
                  //                               color: progressBarColor,
                  //                               borderRadius:
                  //                                   BorderRadius.circular(50)),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     SizedBox(
                  //                       height: 4.h,
                  //                     ),
                  //                     Align(
                  //                       alignment: Alignment.topLeft,
                  //                       child: Text(
                  //                         'Introduction',
                  //                         style: textStyle(
                  //                           fontSize: 9.sp,
                  //                           fontWeight: FontWeight.w600,
                  //                           color: textColor,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     SizedBox(
                  //                       height: 10.h,
                  //                     ),
                  //                     Align(
                  //                       alignment: Alignment.topLeft,
                  //                       child: Container(
                  //                         width: 50.w,
                  //                         height: 45.h,
                  //                         decoration: BoxDecoration(
                  //                           borderRadius:
                  //                               BorderRadius.circular(8),
                  //                           color: textColor,
                  //                         ),
                  //                         child: Icon(
                  //                           FontAwesomeIcons.ghost,
                  //                           color: iconColor,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     SizedBox(
                  //                       height: 8.h,
                  //                     ),
                  //                     Align(
                  //                       alignment: Alignment.topLeft,
                  //                       child: Text(
                  //                         'What is ${content.title}?',
                  //                         style: TextStyle(
                  //                             color: textColor,
                  //                             fontSize: 20.sp,
                  //                             fontWeight: FontWeight.bold),
                  //                       ),
                  //                     ),
                  //                     SizedBox(
                  //                       height: 6.h,
                  //                     ),
                  //                     Align(
                  //                       alignment: Alignment.topLeft,
                  //                       child: Column(
                  //                         children: [
                  //                           Text(
                  //                             '${content.title} is widely\nused program\ndynamic websites',
                  //                             style: textStyle(
                  //                               fontSize: 11.sp,
                  //                               color: textColor,
                  //                               letterSpacing: 1,
                  //                               fontWeight: FontWeight.bold,
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                     Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Text(
                  //                           "30 min",
                  //                           style: textStyle(
                  //                             fontSize: 9.sp,
                  //                             fontWeight: FontWeight.w600,
                  //                             color: textColor,
                  //                           ),
                  //                         ),
                  //                         IconButton(
                  //                             onPressed: () {},
                  //                             icon: Icon(
                  //                               Icons.arrow_forward,
                  //                               color: iconColor,
                  //                             ))
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           height: 10.h,
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                  );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
