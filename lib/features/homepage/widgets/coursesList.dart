import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/core/ui/textStyle.dart';
import 'package:online_learning_app/features/homepage/models/category_by_id_content.dart';
import 'package:online_learning_app/features/homepage/respository/category_respository.dart';
import 'package:online_learning_app/features/homepage/view/homePage.dart';
import 'package:online_learning_app/features/homepage/view/storyView.dart';
import 'package:online_learning_app/features/utils/route.dart';
import 'package:page_transition/page_transition.dart';

import '../../login/loginPage.dart';
import '../bloc/catergory_bloc.dart';

class CoursesList extends StatefulWidget {
  CoursesList({Key? key, this.isContent}) : super(key: key);
  bool? isContent;

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  List<int> box = [0, 4, 6, 10, 12, 16, 18, 22];
  @override
  Widget build(BuildContext context) {
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
                      return Padding(
                          padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          child: state.categoryModelById.data!.contents!.isEmpty
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
                                  itemCount: state
                                      .categoryModelById.data!.contents!.length,
                                  itemBuilder: (context, index) {
                                    final contentbyId = state.categoryModelById
                                        .data!.contents![index];
                                    return index == 1
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: LoginPage()),
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.sp),
                                                  // color: const Color(0xffE6E6E6),
                                                  color: unselectedColor,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.sp,
                                                      vertical: 8.sp),
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text('Login',
                                                            style: textStyle(
                                                                fontSize: 10.sp,
                                                                color: white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ),
                                                      SizedBox(
                                                        height: 6.h,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                            'Login for dashboard',
                                                            textAlign:
                                                                TextAlign.left,
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            style: textStyle(
                                                                fontSize: 15.sp,
                                                                color: white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      SizedBox(
                                                        height: 6.h,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                            'Give you access to premium content',
                                                            style: textStyle(
                                                                fontSize: 8.sp,
                                                                letterSpacing:
                                                                    1,
                                                                color: white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () async {
                                              context.read<CategoryBloc>().add(
                                                  FetchCategoryByIdContentEvent(
                                                      contentbyId.id!));
                                              Navigator.pushNamed(
                                                  context, storyScreen);
                                            },
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.sp),
                                                    // color: const Color(0xffE6E6E6),
                                                    color: containerColor,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.sp,
                                                            vertical: 8.sp),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                              // isContent
                                                              //     ?
                                                              '${contentbyId.title}',
                                                              // : '${state.categoryModelById.data!.name}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              style: textStyle(
                                                                fontSize: 15.sp,
                                                                letterSpacing:
                                                                    .5,
                                                                color:
                                                                    textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          height: 5.sp,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                              // isContent
                                                              //     ?
                                                              '${contentbyId.excerpt}',
                                                              // : '${state.categoryModelById.data!.description}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: (index ==
                                                                          0 ||
                                                                      (index % 2 ==
                                                                              0 &&
                                                                          index >
                                                                              2))
                                                                  ? 9
                                                                  : 2,
                                                              style: textStyle(
                                                                fontSize: 11.sp,
                                                                color:
                                                                    textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                      return Padding(
                          padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                          child: GridView.builder(
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
                            itemCount: state.contentModel.length,
                            itemBuilder: (context, index) {
                              final content = state.contentModel[index];
                              return index == 1
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: LoginPage()),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.sp),
                                            // color: const Color(0xffE6E6E6),
                                            color: unselectedColor,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.sp,
                                                vertical: 8.sp),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text('Login',
                                                      style: textStyle(
                                                          fontSize: 10.sp,
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      'Login for dashboard',
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: textStyle(
                                                          fontSize: 15.sp,
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      'Give you access to premium content',
                                                      style: textStyle(
                                                          fontSize: 8.sp,
                                                          letterSpacing: 1,
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          // color: const Color(0xffE6E6E6),
                                          color: containerColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.sp,
                                              vertical: 5.sp),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                    // isContent
                                                    //     ?
                                                    '${content.title} ${index}',
                                                    // : '${state.categoryModelById.data!.name}',
                                                    textAlign: TextAlign.left,
                                                    overflow: TextOverflow.fade,
                                                    style: textStyle(
                                                        fontSize: 15.sp,
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SizedBox(
                                                height: 5.sp,
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                    '${content.excerpt} {$index}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: (index == 0 ||
                                                            (index % 2 == 0 &&
                                                                index > 2))
                                                        ? 8
                                                        : 2,
                                                    style: textStyle(
                                                        fontSize: 11.sp,
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                          ));
                    } else {
                      return Container();
                    }
                  },
                )),
    );
  }
}
