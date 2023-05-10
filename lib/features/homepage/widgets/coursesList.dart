import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/core/ui/textStyle.dart';
import 'package:online_learning_app/features/homepage/models/category_id_model.dart';
import 'package:online_learning_app/features/homepage/models/content_model.dart';
import 'package:online_learning_app/features/homepage/respository/category_respository.dart';
import 'package:online_learning_app/features/utils/route.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/catergory_bloc.dart';

class CoursesList extends StatefulWidget {
  CoursesList({Key? key, this.isContent, this.categoryId}) : super(key: key);
  bool? isContent;
  String? categoryId;

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  final scrollController = ScrollController();
  final categoryidscrollController = ScrollController();
  // ContentModel? contentModel;
  CategoryModelById? categoryModelById;
  List<Content> contest = [];
  List<CategoryContent> category = [];
  int _currentPage = 1;
  int _categoryPage = 1;
  bool _isLoading = false;
  bool _iscategoryLoading = false;
  String? token;

  @override
  void initState() {
    super.initState();

    token = TokenService().getToken();
  }

  Future<void> _getCategoryContent() async {
    context
        .read<CategoryBloc>()
        .add(FetchCataegoryEventById(widget.categoryId!));
  }

  Future<void> _getContent() async {
    context.read<CategoryBloc>().page = 1;

    context.read<CategoryBloc>().add(FetchAllContentEvent());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CategoryBloc>().state;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColor,
      body: widget.isContent!
          // ? BlocListener<CategoryBloc, CategoryState>(
          //     listener: (context, state) {
          //       if (state.categoryByIdStatus == CategoryByIdStatus.success) {
          //         token != null
          //             ? setState(() {
          //                 category =
          //                     state.categoryModelById.data!.contents!.contents!;
          //                 print(category.toString() + 'kjh');
          //               })
          //             : setState(() {
          //                 addCategory(state);
          //               });
          //       } else if (state.categoryByIdStatus ==
          //           CategoryByIdStatus.loading) {
          //         Center(
          //           child: CircularProgressIndicator(
          //             color: iconColor,
          //           ),
          //         );
          //       }
          //     },
          //     child: Padding(
          //         padding:
          //             EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 15.sp),
          //         child: state
          //                 .categoryModelById.data!.contents!.contents!.isEmpty
          //             ? const Center(
          //                 child: Text("Sorry Category Content Not Available"),
          //               )
          //             : GridView.builder(
          //                 controller: categoryidscrollController,
          //                 gridDelegate: SliverQuiltedGridDelegate(
          //                     mainAxisSpacing: 6,
          //                     crossAxisCount: 4,
          //                     crossAxisSpacing: 6,
          //                     repeatPattern: QuiltedGridRepeatPattern.inverted,
          //                     pattern: const [
          //                       QuiltedGridTile(2, 2),
          //                       QuiltedGridTile(1, 2),
          //                       QuiltedGridTile(1, 2),
          //                     ]),
          //                 // itemCount: token != null
          //                 //     ? state.categoryModelById.data!.contents!
          //                 //         .contents!.length
          //                 //     : category.length,
          //                 itemCount: category.length,
          //                 itemBuilder: (context, index) {
          //                   final contentbyId = token != null
          //                       ? state.categoryModelById.data!.contents!
          //                           .contents![index]
          //                       : category[index];
          //                   final iconCode = state.categoryModelById.data!.icon;
          //                   return GestureDetector(
          //                     onTap: () {
          //                       // }
          //                       if (token == null) {
          //                         if (index == 1) {
          //                           Navigator.of(context).pushNamed(
          //                             loginScreen,
          //                           );
          //                         } else {
          //                           context.read<CategoryBloc>().add(
          //                               FetchCategoryByIdContentEvent(
          //                                   contentbyId.id!));
          //                           Navigator.pushNamed(
          //                               context, '/storyScreen');
          //                         }
          //                       } else {
          //                         context.read<CategoryBloc>().add(
          //                             FetchCategoryByIdContentEvent(
          //                                 contentbyId.id!));
          //                         Navigator.pushNamed(context, '/storyScreen');
          //                       }
          //                     },
          //                     child: ClipRRect(
          //                         borderRadius: BorderRadius.circular(8),
          //                         child: Container(
          //                           decoration: BoxDecoration(
          //                             borderRadius:
          //                                 BorderRadius.circular(10.sp),
          //                             // color: const Color(0xffE6E6E6),
          //                             color: token == null
          //                                 ? index == 1
          //                                     ? unselectedColor
          //                                     : containerColor
          //                                 : containerColor,
          //                           ),
          //                           child: Padding(
          //                             padding: EdgeInsets.symmetric(
          //                                 horizontal: 15.sp, vertical: 8.sp),
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.center,
          //                               children: [
          //                                 index == 1
          //                                     ? const SizedBox(
          //                                         height: 2,
          //                                       )
          //                                     : SizedBox(
          //                                         height: 0.h,
          //                                       ),
          //                                 (index == 0 ||
          //                                         (index % 2 == 0 &&
          //                                                 index > 2) &&
          //                                             index != 8 &&
          //                                             index != 14 &&
          //                                             index != 20)
          //                                     ? Align(
          //                                         alignment: Alignment.topLeft,
          //                                         child: Container(
          //                                           width: 40.w,
          //                                           height: 40.h,
          //                                           decoration: BoxDecoration(
          //                                             borderRadius:
          //                                                 BorderRadius.circular(
          //                                                     8),
          //                                             color: unselectedColor,
          //                                           ),
          //                                           child:
          //                                               catergoryIcon(iconCode),
          //                                         ),
          //                                       )
          //                                     : Container(),
          //                                 SizedBox(
          //                                   height: 5.sp,
          //                                 ),
          //                                 Align(
          //                                   alignment: Alignment.topLeft,
          //                                   child: Text(
          //                                       // isContent
          //                                       //     ?
          //                                       '${contentbyId.title}',
          //                                       // : '${state.categoryModelById.data!.name}',
          //                                       textAlign: TextAlign.left,
          //                                       overflow: TextOverflow.fade,
          //                                       style: textStyle(
          //                                         fontSize: 15.sp,
          //                                         letterSpacing: .5,
          //                                         color: token == null
          //                                             ? index == 1
          //                                                 ? white
          //                                                 : textColor
          //                                             : textColor,
          //                                         fontWeight: FontWeight.bold,
          //                                       )),
          //                                 ),
          //                                 Align(
          //                                   alignment: Alignment.topLeft,
          //                                   child: Text(
          //                                       // isContent
          //                                       //     ?
          //                                       '${contentbyId.excerpt}{$index}',
          //                                       // : '${state.categoryModelById.data!.description}',
          //                                       overflow: TextOverflow.ellipsis,
          //                                       maxLines: (index == 0 ||
          //                                               (index % 2 == 0 &&
          //                                                       index > 2) &&
          //                                                   index != 8)
          //                                           ? 5
          //                                           : 2,
          //                                       style: textStyle(
          //                                         fontSize: 11.sp,
          //                                         color: token == null
          //                                             ? index == 1
          //                                                 ? white
          //                                                 : textColor
          //                                             : textColor,
          //                                         fontWeight: FontWeight.w600,
          //                                       )),
          //                                 )
          //                               ],
          //                             ),
          //                           ),
          //                         )),
          //                   );
          //                 },
          //               )))
          ? BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state.categoryByIdStatus == CategoryByIdStatus.loading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: iconColor,
                    ),
                  );
                } else if (state.categoryByIdStatus ==
                    CategoryByIdStatus.success) {
                  addCategory(state);

                  return RefreshIndicator(
                    displacement: 50,
                    color: iconColor,
                    edgeOffset: 0,
                    backgroundColor: unselectedColor,
                    strokeWidth: 3,
                    onRefresh: () async {
                      await _getCategoryContent();
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.sp, right: 15.sp, bottom: 15.sp),
                        child: state.categoryModelById.data!.contents!.contents!
                                .isEmpty
                            ? const Center(
                                // child: Text(
                                //     "Sorry Category Content Not Available"),
                                child: Text("Content Not Available"),
                              )
                            : GridView.builder(
                                // controller: context
                                //     .read<CategoryBloc>()
                                //     .scrollCategoryController,
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
                                itemCount: token != null
                                    ? state.categoryModelById.data!.contents!
                                        .contents!.length
                                    : category.length,
                                itemBuilder: (context, index) {
                                  final contentbyId = token != null
                                      ? state.categoryModelById.data!.contents!
                                          .contents![index]
                                      : category[index];
                                  final iconCode =
                                      state.categoryModelById.data!.icon;
                                  return GestureDetector(
                                    onTap: () {
                                      if (token == null) {
                                        if (index == 1) {
                                          Navigator.of(context).pushNamed(
                                            loginScreen,
                                          );
                                        } else {
                                          context.read<CategoryBloc>().add(
                                              FetchCategoryByIdContentEvent(
                                                  contentbyId.id!));
                                          Navigator.pushNamed(
                                              context, '/storyScreen');
                                        }
                                      } else {
                                        context.read<CategoryBloc>().add(
                                            FetchCategoryByIdContentEvent(
                                                contentbyId.id!));
                                        Navigator.pushNamed(
                                            context, '/storyScreen');
                                      }
                                    },
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.sp),
                                            // color: const Color(0xffE6E6E6),
                                            color: token == null
                                                ? index == 1
                                                    ? unselectedColor
                                                    : containerColor
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
                                                    ? const SizedBox(
                                                        height: 2,
                                                      )
                                                    : SizedBox(
                                                        height: 0.h,
                                                      ),
                                                (index == 0 ||
                                                        (index % 2 == 0 &&
                                                                index > 2) &&
                                                            index != 8 &&
                                                            index != 14 &&
                                                            index != 20)
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
                                                          child: catergoryIcon(
                                                              iconCode),
                                                        ),
                                                      )
                                                    : Container(),
                                                SizedBox(
                                                  height: 5.sp,
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      // isContent
                                                      //     ?
                                                      '${contentbyId.title}',
                                                      // : '${state.categoryModelById.data!.name}',
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: textStyle(
                                                        fontSize: 15.sp,
                                                        letterSpacing: .5,
                                                        color: token == null
                                                            ? index == 1
                                                                ? white
                                                                : textColor
                                                            : textColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      // isContent
                                                      //     ?
                                                      '${contentbyId.excerpt}',
                                                      // : '${state.categoryModelById.data!.description}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: (index == 0 ||
                                                              (index % 2 == 0 &&
                                                                      index >
                                                                          2) &&
                                                                  index != 8)
                                                          ? 5
                                                          : 2,
                                                      style: textStyle(
                                                        fontSize: 11.sp,
                                                        color: token == null
                                                            ? index == 1
                                                                ? white
                                                                : textColor
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
                              )),
                  );
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
                  // return SimmerLoader();

                }
                // else if (state.contentStatus == ContentStatus.fetchingMore) {
                //   return Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Center(
                //       child: Align(
                //         alignment: Alignment.bottomCenter,
                //         child: CircularProgressIndicator(),
                //       ),
                //     ),
                //   );
                // }
                else if (state.contentStatus == ContentStatus.success) {
                  addContent(state);
                  return RefreshIndicator(
                    displacement: 50,
                    color: iconColor,
                    edgeOffset: 0,
                    backgroundColor: unselectedColor,
                    strokeWidth: 3,
                    onRefresh: () async {
                      await _getContent();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 15.sp, right: 15.sp, bottom: 15.sp),
                      child: GridView.builder(
                        controller:
                            context.read<CategoryBloc>().scrollController,
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
                        itemCount: token != null
                            ? state.content.length
                            : contest.length,
                        itemBuilder: (context, index) {
                          final content = token != null
                              ? state.content[index]
                              : contest[index];
                          return GestureDetector(
                            onTap: () {
                              if (token == null) {
                                if (index == 1) {
                                  Navigator.of(context).pushNamed(
                                    loginScreen,
                                  );
                                } else {
                                  context.read<CategoryBloc>().add(
                                      FetchCategoryByIdContentEvent(
                                          content.id!));
                                  Navigator.pushNamed(context, storyScreen);
                                }
                              } else {
                                context.read<CategoryBloc>().add(
                                    FetchCategoryByIdContentEvent(content.id!));
                                Navigator.pushNamed(context, storyScreen);
                              }
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: token == null
                                          ? index == 1
                                              ? unselectedColor
                                              : containerColor
                                          : containerColor),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.sp, vertical: 8.sp),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        index == 1
                                            ? const SizedBox(
                                                height: 2,
                                              )
                                            : SizedBox(
                                                height: 0.h,
                                              ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('${content.title} ',
                                              // : '${state.categoryModelById.data!.name}',
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.fade,
                                              style: textStyle(
                                                  fontSize: 15.sp,
                                                  letterSpacing: .5,
                                                  // color: index == 1
                                                  //     ? white
                                                  //     : textColor,
                                                  color: token == null
                                                      ? index == 1
                                                          ? white
                                                          : textColor
                                                      : textColor,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('${content.excerpt}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: (index == 0 ||
                                                      (index % 2 == 0 &&
                                                              index > 2) &&
                                                          index != 8)
                                                  ? 8
                                                  : 2,
                                              style: textStyle(
                                                  fontSize: 11.sp,
                                                  color: token == null
                                                      ? index == 1
                                                          ? white
                                                          : textColor
                                                      : textColor,
                                                  // color: index == 1
                                                  //     ? white
                                                  //     : textColor,
                                                  fontWeight: FontWeight.w600)),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
    ));
  }

  Widget catergoryIcon(String? iconCode) {
    var icons = iconCode!.split('-');
    var iconName = icons[0];
    var iconType = icons[1].toLowerCase();
    switch (iconType) {
      case "brands":
        return Icon(
          IconDataBrands(int.parse('0x$iconName')),
          size: 25,
          color: listIconColor,
        );
      case "solid":
        return Icon(
          IconDataSolid(int.parse('0x$iconName')),
          size: 25,
          color: listIconColor,
        );
      case "regular":
        return Icon(
          IconDataRegular(int.parse('0x$iconName')),
          size: 25,
          color: listIconColor,
        );
      default:
        return SizedBox.shrink();
    }
  }

  void addContent(CategoryState state) {
    contest.clear();
    contest.addAll([...state.content]);
    if (contest.isEmpty) {
    } else {
      contest.insert(
          1,
          Content(
              id: 'id',
              title: 'Login For DashBoard',
              slug: 'slug',
              status: 'status',
              categoryId: 'categoryId',
              topicId: 'topicId',
              description: 'description',
              excerpt: 'Give you access to premium content',
              createdAt: null,
              updatedAt: null));
    }
  }

  void addCategory(CategoryState state) {
    category.clear();
    category.addAll([...state.categoryModelById.data!.contents!.contents!]);
    if (category.isEmpty) {
    } else {
      category.insert(
        1,
        CategoryContent(
            id: 'id',
            title: 'Login For DashBoard',
            slug: 'slug',
            status: 'status',
            categoryId: 'categoryId',
            topicId: 'topicId',
            description: 'description',
            excerpt: 'Give you access to premium content',
            createdAt: null,
            updatedAt: null),
      );
    }
  }
}

class SimmerLoader extends StatelessWidget {
  const SimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey,
        enabled: true,
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
            itemCount: 10,
            itemBuilder: (context, index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: containerColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 8.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(' ',
                                // : '${state.categoryModelById.data!.name}',
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.fade,
                                style: textStyle(
                                    fontSize: 15.sp,
                                    letterSpacing: .5,
                                    // color: index == 1
                                    //     ? white
                                    //     : textColor,
                                    color: textColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('',
                                overflow: TextOverflow.ellipsis,
                                maxLines: (index == 0 ||
                                        (index % 2 == 0 && index > 2) &&
                                            index != 8)
                                    ? 8
                                    : 2,
                                style: textStyle(
                                    fontSize: 11.sp,
                                    color: textColor,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
