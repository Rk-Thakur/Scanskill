import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/core/ui/textStyle.dart';
import 'package:online_learning_app/features/homepage/models/category_id_model.dart';
import 'package:online_learning_app/features/homepage/models/content_model.dart';

import 'package:online_learning_app/features/utils/route.dart';
import 'package:page_transition/page_transition.dart';

import '../../authentication/view/loginPage.dart';
import '../bloc/catergory_bloc.dart';

class CoursesList extends StatefulWidget {
  CoursesList({Key? key, this.isContent}) : super(key: key);
  bool? isContent;

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  List<ContentModel> contest = [];
  List<Content> category = [];
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //       backgroundColor: backGroundColor,
    //       body: widget.isContent!
    //           ? BlocBuilder<CategoryBloc, CategoryState>(
    //               builder: (context, state) {
    //                 if (state.categoryByIdStatus ==
    //                     CategoryByIdStatus.loading) {
    //                   return Center(
    //                     child: CircularProgressIndicator(
    //                       color: iconColor,
    //                     ),
    //                   );
    //                 } else if (state.categoryByIdStatus ==
    //                     CategoryByIdStatus.success) {
    //                   return Padding(
    //                       padding: EdgeInsets.only(
    //                           left: 15.sp, right: 15.sp, bottom: 15.sp),
    //                       child: state.categoryModelById.data!.contents!.isEmpty
    //                           ? const Center(
    //                               child: Text("Sorry Content Not Available"),
    //                             )
    //                           : GridView.builder(
    //                               gridDelegate: SliverQuiltedGridDelegate(
    //                                   mainAxisSpacing: 6,
    //                                   crossAxisCount: 4,
    //                                   crossAxisSpacing: 6,
    //                                   repeatPattern:
    //                                       QuiltedGridRepeatPattern.inverted,
    //                                   pattern: const [
    //                                     QuiltedGridTile(2, 2),
    //                                     QuiltedGridTile(1, 2),
    //                                     QuiltedGridTile(1, 2),
    //                                   ]),
    //                               itemCount: state
    //                                   .categoryModelById.data!.contents!.length,
    //                               itemBuilder: (context, index) {
    //                                 final contentbyId = state.categoryModelById
    //                                     .data!.contents![index];
    //                                 return index == 1
    //                                     ? GestureDetector(
    //                                         onTap: () {
    //                                           Navigator.of(context).push(
    //                                             PageTransition(
    //                                                 type:
    //                                                     PageTransitionType.fade,
    //                                                 child: LoginPage()),
    //                                           );
    //                                         },
    //                                         child: ClipRRect(
    //                                           borderRadius:
    //                                               BorderRadius.circular(8),
    //                                           child: Container(
    //                                             decoration: BoxDecoration(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(
    //                                                       10.sp),
    //                                               // color: const Color(0xffE6E6E6),
    //                                               color: unselectedColor,
    //                                             ),
    //                                             child: Padding(
    //                                               padding: EdgeInsets.symmetric(
    //                                                   horizontal: 15.sp,
    //                                                   vertical: 8.sp),
    //                                               child: Column(
    //                                                 children: [
    //                                                   Align(
    //                                                     alignment:
    //                                                         Alignment.topLeft,
    //                                                     child: Text('Login',
    //                                                         style: textStyle(
    //                                                             fontSize: 10.sp,
    //                                                             color: white,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w600)),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 6.h,
    //                                                   ),
    //                                                   Align(
    //                                                     alignment:
    //                                                         Alignment.topLeft,
    //                                                     child: Text(
    //                                                         'Login for dashboard',
    //                                                         textAlign:
    //                                                             TextAlign.left,
    //                                                         overflow:
    //                                                             TextOverflow
    //                                                                 .fade,
    //                                                         style: textStyle(
    //                                                             fontSize: 15.sp,
    //                                                             color: white,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .bold)),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 6.h,
    //                                                   ),
    //                                                   Align(
    //                                                     alignment:
    //                                                         Alignment.topLeft,
    //                                                     child: Text(
    //                                                         'Give you access to premium content',
    //                                                         style: textStyle(
    //                                                             fontSize: 8.sp,
    //                                                             letterSpacing:
    //                                                                 1,
    //                                                             color: white,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w600)),
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       )
    //                                     : GestureDetector(
    //                                         onTap: () async {
    //                                           context.read<CategoryBloc>().add(
    //                                               FetchCategoryByIdContentEvent(
    //                                                   contentbyId.id!));
    //                                           Navigator.pushNamed(
    //                                               context, storyScreen);
    //                                         },
    //                                         child: ClipRRect(
    //                                             borderRadius:
    //                                                 BorderRadius.circular(8),
    //                                             child: Container(
    //                                               decoration: BoxDecoration(
    //                                                 borderRadius:
    //                                                     BorderRadius.circular(
    //                                                         10.sp),
    //                                                 // color: const Color(0xffE6E6E6),
    //                                                 color: containerColor,
    //                                               ),
    //                                               child: Padding(
    //                                                 padding:
    //                                                     EdgeInsets.symmetric(
    //                                                         horizontal: 8.sp,
    //                                                         vertical: 8.sp),
    //                                                 child: Column(
    //                                                   crossAxisAlignment:
    //                                                       CrossAxisAlignment
    //                                                           .center,
    //                                                   children: [
    //                                                     Align(
    //                                                       alignment:
    //                                                           Alignment.topLeft,
    //                                                       child: Text(
    //                                                           // isContent
    //                                                           //     ?
    //                                                           '${contentbyId.title}',
    //                                                           // : '${state.categoryModelById.data!.name}',
    //                                                           textAlign:
    //                                                               TextAlign
    //                                                                   .left,
    //                                                           overflow:
    //                                                               TextOverflow
    //                                                                   .fade,
    //                                                           style: textStyle(
    //                                                             fontSize: 15.sp,
    //                                                             letterSpacing:
    //                                                                 .5,
    //                                                             color:
    //                                                                 textColor,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .bold,
    //                                                           )),
    //                                                     ),
    //                                                     SizedBox(
    //                                                       height: 5.sp,
    //                                                     ),
    //                                                     Align(
    //                                                       alignment:
    //                                                           Alignment.topLeft,
    //                                                       child: Text(
    //                                                           // isContent
    //                                                           //     ?
    //                                                           '${contentbyId.excerpt}',
    //                                                           // : '${state.categoryModelById.data!.description}',
    //                                                           overflow:
    //                                                               TextOverflow
    //                                                                   .ellipsis,
    //                                                           maxLines: (index ==
    //                                                                       0 ||
    //                                                                   (index % 2 == 0 &&
    //                                                                           index >
    //                                                                               2) &&
    //                                                                       index !=
    //                                                                           8)
    //                                                               ? 9
    //                                                               : 2,
    //                                                           style: textStyle(
    //                                                             fontSize: 11.sp,
    //                                                             color:
    //                                                                 textColor,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w600,
    //                                                           )),
    //                                                     )
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             )),
    //                                       );
    //                               },
    //                             ));
    //                 } else {
    //                   return Container();
    //                 }
    //               },
    //             )
    //           : BlocBuilder<CategoryBloc, CategoryState>(
    //               builder: (context, state) {
    //                 if (state.contentStatus == ContentStatus.loading) {
    //                   return Center(
    //                     child: CircularProgressIndicator(
    //                       color: iconColor,
    //                     ),
    //                   );
    //                 } else if (state.contentStatus == ContentStatus.success) {
    //                   return Padding(
    //                       padding: EdgeInsets.only(
    //                           left: 15.sp, right: 15.sp, bottom: 15.sp),
    //                       child: state.contentModel.isEmpty
    //                           ? const Center(
    //                               child: Text("Sorry Content Not Available"),
    //                             )
    //                           : GridView.builder(
    //                               gridDelegate: SliverQuiltedGridDelegate(
    //                                   mainAxisSpacing: 6,
    //                                   crossAxisCount: 4,
    //                                   crossAxisSpacing: 6,
    //                                   repeatPattern:
    //                                       QuiltedGridRepeatPattern.inverted,
    //                                   pattern: const [
    //                                     QuiltedGridTile(2, 2),
    //                                     QuiltedGridTile(1, 2),
    //                                     QuiltedGridTile(1, 2),
    //                                   ]),
    //                               itemCount: state.contentModel.length,
    //                               itemBuilder: (context, index) {
    //                                 final content = state.contentModel[index];
    //                                 contest.addAll([content]);
    //                                 return index == 1
    //                                     ? GestureDetector(
    //                                         onTap: () {
    //                                           Navigator.of(context).push(
    //                                             PageTransition(
    //                                                 type:
    //                                                     PageTransitionType.fade,
    //                                                 child: LoginPage()),
    //                                           );
    //                                         },
    //                                         child: ClipRRect(
    //                                           borderRadius:
    //                                               BorderRadius.circular(8),
    //                                           child: Container(
    //                                             decoration: BoxDecoration(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(
    //                                                       10.sp),
    //                                               // color: const Color(0xffE6E6E6),
    //                                               color: unselectedColor,
    //                                             ),
    //                                             child: Padding(
    //                                               padding: EdgeInsets.symmetric(
    //                                                   horizontal: 15.sp,
    //                                                   vertical: 8.sp),
    //                                               child: Column(
    //                                                 children: [
    //                                                   Align(
    //                                                     alignment:
    //                                                         Alignment.topLeft,
    //                                                     child: Text('Login',
    //                                                         style: textStyle(
    //                                                             fontSize: 10.sp,
    //                                                             color: white,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w600)),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 6.h,
    //                                                   ),
    //                                                   Align(
    //                                                     alignment:
    //                                                         Alignment.topLeft,
    //                                                     child: Text(
    //                                                         'Login for dashboard',
    //                                                         textAlign:
    //                                                             TextAlign.left,
    //                                                         overflow:
    //                                                             TextOverflow
    //                                                                 .fade,
    //                                                         style: textStyle(
    //                                                             fontSize: 15.sp,
    //                                                             color: white,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .bold)),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 6.h,
    //                                                   ),
    //                                                   Align(
    //                                                     alignment:
    //                                                         Alignment.topLeft,
    //                                                     child: Text(
    //                                                         'Give you access to premium content',
    //                                                         style: textStyle(
    //                                                             fontSize: 8.sp,
    //                                                             letterSpacing:
    //                                                                 1,
    //                                                             color: white,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w600)),
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       )
    //                                     : GestureDetector(
    //                                         onTap: () {
    //                                           context.read<CategoryBloc>().add(
    //                                               FetchCategoryByIdContentEvent(
    //                                                   content.id!));
    //                                           Navigator.pushNamed(
    //                                               context, storyScreen);
    //                                         },
    //                                         child: ClipRRect(
    //                                             borderRadius:
    //                                                 BorderRadius.circular(8),
    //                                             child: Container(
    //                                               decoration: BoxDecoration(
    //                                                 borderRadius:
    //                                                     BorderRadius.circular(
    //                                                         10.sp),
    //                                                 // color: const Color(0xffE6E6E6),
    //                                                 color: containerColor,
    //                                               ),
    //                                               child: Padding(
    //                                                 padding:
    //                                                     EdgeInsets.symmetric(
    //                                                         horizontal: 15.sp,
    //                                                         vertical: 5.sp),
    //                                                 child: Column(
    //                                                   crossAxisAlignment:
    //                                                       CrossAxisAlignment
    //                                                           .center,
    //                                                   children: [
    //                                                     Align(
    //                                                       alignment:
    //                                                           Alignment.topLeft,
    //                                                       child: Text(
    //                                                           // isContent
    //                                                           //     ?
    //                                                           '${content.title} ${index}',
    //                                                           // : '${state.categoryModelById.data!.name}',
    //                                                           textAlign:
    //                                                               TextAlign
    //                                                                   .left,
    //                                                           overflow:
    //                                                               TextOverflow
    //                                                                   .fade,
    //                                                           style: textStyle(
    //                                                               fontSize:
    //                                                                   15.sp,
    //                                                               color:
    //                                                                   textColor,
    //                                                               fontWeight:
    //                                                                   FontWeight
    //                                                                       .bold)),
    //                                                     ),
    //                                                     SizedBox(
    //                                                       height: 5.sp,
    //                                                     ),
    //                                                     Align(
    //                                                       alignment:
    //                                                           Alignment.topLeft,
    //                                                       child: Text(
    //                                                           '${content.excerpt} {$index}',
    //                                                           overflow:
    //                                                               TextOverflow
    //                                                                   .ellipsis,
    //                                                           maxLines: (index ==
    //                                                                       0 ||
    //                                                                   (index % 2 == 0 &&
    //                                                                           index >
    //                                                                               2) &&
    //                                                                       index !=
    //                                                                           8)
    //                                                               ? 8
    //                                                               : 2,
    //                                                           // maxLines: index == box
    //                                                           //     ? 2
    //                                                           //     : 8,
    //                                                           style: textStyle(
    //                                                               fontSize:
    //                                                                   11.sp,
    //                                                               color:
    //                                                                   textColor,
    //                                                               fontWeight:
    //                                                                   FontWeight
    //                                                                       .w600)),
    //                                                     )
    //                                                   ],
    //                                                 ),
    //                                               ),
    //                                             )),
    //                                       );
    //                               },
    //                             ));
    //                 } else {
    //                   return Container();
    //                 }
    //               },
    //             )),
    // );

    return SafeArea(
      child: Scaffold(
          backgroundColor: backGroundColor,
          body: widget.isContent!
              ? BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state.categoryByIdStatus ==
                        CategoryByIdStatus.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: iconColor,
                        ),
                      );
                    } else if (state.categoryByIdStatus ==
                        CategoryByIdStatus.success) {
                      addCategory(state);

                      return Padding(
                          padding: EdgeInsets.only(
                              left: 15.sp, right: 15.sp, bottom: 15.sp),
                          child: category.isEmpty
                              ? const Center(
                                  child: Text("Sorry Content Not Available"),
                                )
                              : GridView.builder(
                                  gridDelegate: SliverQuiltedGridDelegate(
                                      mainAxisSpacing: 6,
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 6,
                                      repeatPattern:
                                          QuiltedGridRepeatPattern.inverted,
                                      pattern: const [
                                        QuiltedGridTile(2, 2),
                                        QuiltedGridTile(1, 2),
                                        QuiltedGridTile(1, 2),
                                      ]),
                                  itemCount: category.length,
                                  itemBuilder: (context, index) {
                                    final contentbyId = category[index];

                                    return GestureDetector(
                                      onTap: () {
                                        if (index == 1) {
                                          Navigator.of(context).push(
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: LoginPage()),
                                          );
                                          // Navigator.pushNamed(
                                          //     context, '/loginScreen');
                                        } else {
                                          context.read<CategoryBloc>().add(
                                              FetchCategoryByIdContentEvent(
                                                  contentbyId.id!));
                                          Navigator.pushNamed(
                                              context, storyScreen);
                                        }
                                      },
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.sp),
                                              // color: const Color(0xffE6E6E6),
                                              color: index == 1
                                                  ? unselectedColor
                                                  : containerColor,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.sp,
                                                  vertical: 8.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  index == 1
                                                      ? SizedBox(
                                                          height: 3.h,
                                                        )
                                                      : SizedBox(
                                                          height: 0.h,
                                                        ),
                                                  (index == 0 ||
                                                          (index % 2 == 0 &&
                                                                  index > 2) &&
                                                              index != 8)
                                                      ? Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Container(
                                                              width: 40.w,
                                                              height: 40.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                color:
                                                                    unselectedColor,
                                                              ),
                                                              child: Icon(
                                                                IconDataSolid(
                                                                    int.parse(
                                                                        '0x${state.categoryModelById.data!.icon}')),
                                                                size:
                                                                    buttonSize,
                                                                color:
                                                                    listIconColor,
                                                              )),
                                                        )
                                                      : Container(),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                        // isContent
                                                        //     ?
                                                        '${contentbyId.title}',
                                                        // : '${state.categoryModelById.data!.name}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: textStyle(
                                                          fontSize: 15.sp,
                                                          letterSpacing: .5,
                                                          color: index == 1
                                                              ? white
                                                              : textColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                        // isContent
                                                        //     ?
                                                        '${contentbyId.excerpt}{$index}',
                                                        // : '${state.categoryModelById.data!.description}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: (index == 0 ||
                                                                (index % 2 ==
                                                                            0 &&
                                                                        index >
                                                                            2) &&
                                                                    index != 8)
                                                            ? 5
                                                            : 2,
                                                        style: textStyle(
                                                          fontSize: 11.sp,
                                                          color: index == 1
                                                              ? white
                                                              : textColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                    );
                                  },
                                ));
                    } else {
                      return Container();
                    }
                  },
                )
              : BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state.contentStatus == ContentStatus.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: iconColor,
                        ),
                      );
                    } else if (state.contentStatus == ContentStatus.success) {
                      addContent(state);

                      return Padding(
                          padding: EdgeInsets.only(
                              left: 15.sp, right: 15.sp, bottom: 15.sp),
                          child: contest.isEmpty
                              ? const Center(
                                  child: Text("Sorry Content Not Available"),
                                )
                              : GridView.builder(
                                  gridDelegate: SliverQuiltedGridDelegate(
                                      mainAxisSpacing: 6,
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 6,
                                      repeatPattern:
                                          QuiltedGridRepeatPattern.inverted,
                                      pattern: const [
                                        QuiltedGridTile(2, 2),
                                        QuiltedGridTile(1, 2),
                                        QuiltedGridTile(1, 2),
                                      ]),
                                  itemCount: contest.length,
                                  itemBuilder: (context, index) {
                                    final content = contest[index];
                                    return GestureDetector(
                                      onTap: () {
                                        if (index == 1) {
                                          Navigator.of(context).push(
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: LoginPage()),
                                          );
                                        } else {
                                          context.read<CategoryBloc>().add(
                                              FetchCategoryByIdContentEvent(
                                                  content.id!));
                                          Navigator.pushNamed(
                                              context, storyScreen);
                                        }
                                      },
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.sp),
                                              // color: const Color(0xffE6E6E6),
                                              color: index == 1
                                                  ? unselectedColor
                                                  : containerColor,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.sp,
                                                  vertical: 8.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  index == 1
                                                      ? SizedBox(
                                                          height: 3.h,
                                                        )
                                                      : SizedBox(
                                                          height: 0.h,
                                                        ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                        // isContent
                                                        //     ?
                                                        '${content.title} ',
                                                        // : '${state.categoryModelById.data!.name}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: textStyle(
                                                            fontSize: 15.sp,
                                                            letterSpacing: .5,
                                                            color: index == 1
                                                                ? white
                                                                : textColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  SizedBox(
                                                    height: 5.sp,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                        '${content.excerpt} {$index}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: (index == 0 ||
                                                                (index % 2 ==
                                                                            0 &&
                                                                        index >
                                                                            2) &&
                                                                    index != 8)
                                                            ? 8
                                                            : 2,
                                                        style: textStyle(
                                                            fontSize: 11.sp,
                                                            color: index == 1
                                                                ? white
                                                                : textColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                    );
                                  },
                                ));
                    } else {
                      return Container();
                    }
                  },
                )),
    );
  }

  void addContent(CategoryState state) {
    contest.clear();
    contest.addAll([...state.contentModel]);
    if (contest.isEmpty) {
    } else {
      contest.insert(
          1,
          ContentModel(
              title: 'Login For Dashboard',
              excerpt: 'Give you access to premium content'));
    }
  }

  void addCategory(CategoryState state) {
    category.clear();
    category.addAll([...state.categoryModelById.data!.contents!]);
    if (category.isEmpty) {
    } else {
      category.insert(
          1,
          Content(
              title: 'Login For DashBoard',
              excerpt: 'Give you access to premium content'));
    }
  }
}
