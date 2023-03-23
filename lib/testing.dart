// ignore_for_file: public_member_api_docs, sort_constructors_first
// //   return SafeArea(
// //     child: Scaffold(
// //         backgroundColor: backGroundColor,
// //         body: BlocBuilder<CategoryBloc, CategoryState>(
// //           builder: (context, state) {
// //             if (state.categoryByIdStatus == CategoryByIdStatus.loading) {
// //               return Center(
// //                 child: CircularProgressIndicator(
// //                   color: iconColor,
// //                 ),
// //               );
// //             } else if (state.categoryByIdStatus ==
// //                 CategoryByIdStatus.success) {
// //               widget.isContent! ? addCategory(state) : addContent(state);

// //               return Padding(
// //                   padding: EdgeInsets.only(
// //                       left: 15.sp, right: 15.sp, bottom: 15.sp),
// //                   child: contentList());
// //             } else {
// //               return Container();
// //             }
// //           },
// //         )),
// //   );
// // }

// // GridView contentList() {
// //   return GridView.builder(
// //     gridDelegate: SliverQuiltedGridDelegate(
// //         mainAxisSpacing: 6,
// //         crossAxisCount: 4,
// //         crossAxisSpacing: 6,
// //         repeatPattern: QuiltedGridRepeatPattern.inverted,
// //         pattern: const [
// //           QuiltedGridTile(2, 2),
// //           QuiltedGridTile(1, 2),
// //           QuiltedGridTile(1, 2),
// //         ]),
// //     itemCount: widget.isContent! ? category.length : contest.length,
// //     itemBuilder: (context, index) {
// //       // final contentbyId = category[index];
// //       // final content = contest[index];

// //       return GestureDetector(
// //         onTap: () {
// //           if (index == 1) {
// //             Navigator.of(context).push(
// //               PageTransition(
// //                   type: PageTransitionType.fade, child: LoginPage()),
// //             );
// //           } else {
// //             context.read<CategoryBloc>().add(FetchCategoryByIdContentEvent(
// //                 widget.isContent!
// //                     ? category[index].id!
// //                     : contest[index].id!));
// //             Navigator.pushNamed(context, storyScreen);
// //           }
// //         },
// //         child: ClipRRect(
// //             borderRadius: BorderRadius.circular(8),
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10.sp),
// //                 // color: const Color(0xffE6E6E6),
// //                 color: index == 1 ? unselectedColor : containerColor,
// //               ),
// //               child: Padding(
// //                 padding:
// //                     EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     index == 1
// //                         ? SizedBox(
// //                             height: 3.h,
// //                           )
// //                         : SizedBox(
// //                             height: 0.h,
// //                           ),
// //                     Align(
// //                       alignment: Alignment.topLeft,
// //                       child: Text(
// //                           // isContent
// //                           //     ?
// //                           widget.isContent!
// //                               ? '${category[index].title}'
// //                               : '${contest[index].title}',
// //                           // : '${state.categoryModelById.data!.name}',
// //                           textAlign: TextAlign.left,
// //                           overflow: TextOverflow.fade,
// //                           style: textStyle(
// //                             fontSize: 15.sp,
// //                             letterSpacing: .5,
// //                             color: index == 1 ? white : textColor,
// //                             fontWeight: FontWeight.bold,
// //                           )),
// //                     ),
// //                     SizedBox(
// //                       height: 5.sp,
// //                     ),
// //                     Align(
// //                       alignment: Alignment.topLeft,
// //                       child: Text(
// //                           // isContent
// //                           //     ?
// //                           widget.isContent!
// //                               ? '${category[index].excerpt}'
// //                               : '${contest[index].excerpt}{$index}',
// //                           // : '${state.categoryModelById.data!.description}',
// //                           overflow: TextOverflow.ellipsis,
// //                           maxLines: (index == 0 ||
// //                                   (index % 2 == 0 && index > 2) && index != 8)
// //                               ? 8
// //                               : 2,
// //                           style: textStyle(
// //                             fontSize: 11.sp,
// //                             color: index == 1 ? white : textColor,
// //                             fontWeight: FontWeight.w600,
// //                           )),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             )),
// //       );
// //     },
// //   );
// // }
// import 'package:flutter/material.dart';

// class Testing extends StatefulWidget {
//   const Testing({Key? key}) : super(key: key);

//   @override
//   State<Testing> createState() => _TestingState();
// }

// class _TestingState extends State<Testing> {
//   Offset? _tapPosition;
//   void _getTapPosition(TapDownDetails details) async {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;

//     final tapPosition = details.globalPosition;
//     setState(() {
//       if (tapPosition.dx < screenWidth / 5 &&
//           tapPosition.dy < screenHeight / 1.15) {
//         print('left');
//         _tapPosition = tapPosition;
//       } else if (tapPosition.dx > 3 * screenWidth / 4 &&
//           tapPosition.dy < screenHeight / 1.15) {
//         print('right ');
//         _tapPosition = tapPosition;
//       } else if (tapPosition.dx < screenWidth / 1.5 &&
//           tapPosition.dy < screenHeight / 1.40) {
//         print('center');
//         _tapPosition = tapPosition;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (details) {
//         _getTapPosition(details);
//       },
//       child: Scaffold(
//         body: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width / 5,
//                   height: MediaQuery.of(context).size.height / 1.20,
//                   decoration: BoxDecoration(color: Colors.red),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   height: MediaQuery.of(context).size.height / 1.5,
//                   decoration: BoxDecoration(color: Colors.black),
//                 ),
//                 Container(
//                   width: 2 * MediaQuery.of(context).size.width / 3,
//                   height: MediaQuery.of(context).size.height / 1.20,
//                   decoration: BoxDecoration(color: Colors.green),
//                 ),
//               ],
//             ),
//             Text('$_tapPosition')
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_app/features/homepage/models/category_id_model.dart';

class PaginationDemo extends StatefulWidget {
  @override
  _PaginationDemoState createState() => _PaginationDemoState();
}

class _PaginationDemoState extends State<PaginationDemo> {
  final scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoading = false;
  final Dio _dio = Dio();
  List post = [];
  List<dynamic> contest = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    _fetchPosts();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchPosts() async {
    try {
      final response = await _dio.get(
          // 'https://jsonplaceholder.typicode.com/posts?_page=$_currentPage&_limit=10');
          // 'https://jsonplaceholder.typicode.com/posts?_page=$_currentPage&_limit=3');
          'http://app.scanskill.com/public/api/content?limit=8&page=$_currentPage');
      print(response.data['data']['contents']);
      print(response.data['data']['pagination']['hasNext']);
      setState(() {
        contest = contest + response.data['data']['contents'];
      });
    } catch (e) {
      print(e);
      throw 'failure';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagination Demo'),
        ),
        body: ListView.builder(
            controller: scrollController,
            itemCount: _isLoading ? contest.length + 1 : contest.length,
            itemBuilder: (context, index) {
              if (index < contest.length) {
                final posts = contest[index];
                // final title = posts.title;
                return Container(
                  height: 300,
                  color: index % 2 == 0 ? Colors.red : Colors.teal,
                  child: ListTile(
                    title: Text(index.toString()),
                    subtitle: Text(index.toString()),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
            }));
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        _isLoading = true;
      });
      _currentPage = _currentPage + 1;
      print('call');
      await _fetchPosts();
      setState(() {
        _isLoading = false;
      });
    } else {
      print("not call");
    }
  }
}
