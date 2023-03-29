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

// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:online_learning_app/features/homepage/models/category_id_model.dart';
// import 'package:online_learning_app/features/homepage/models/content_model.dart';

// class PaginationDemo extends StatefulWidget {
//   @override
//   _PaginationDemoState createState() => _PaginationDemoState();
// }

// class _PaginationDemoState extends State<PaginationDemo> {
//   final scrollController = ScrollController();
//   int _currentPage = 1;
//   bool _isLoading = false;
//   final Dio _dio = Dio();
//   List post = [];
//   List<dynamic> contest = [];

//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(_scrollListener);
//     _fetchPosts();
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }

//   Future<void> _fetchPosts() async {
//     try {
//       final response = await _dio.get(
//           // 'https://jsonplaceholder.typicode.com/posts?_page=$_currentPage&_limit=10');

//           'http://app.scanskill.com/public/api/content?limit=8&page=$_currentPage');
//       print(response.data['data']['contents']);
//       print(response.data['data']['pagination']['hasNext']);
//       setState(() {
//         // contest = contest + response.data['data']['contents'];
//         contest.addAll([...response.data['data']['contents']]);
//       });
//     } catch (e) {
//       print(e);
//       throw 'failure';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Pagination Demo'),
//         ),
//         body: ListView.builder(
//             controller: scrollController,
//             itemCount: _isLoading ? contest.length + 1 : contest.length,
//             itemBuilder: (context, index) {
//               if (index < contest.length) {
//                 final posts = contest[index]['title'];
//                 // final title = posts.title;
//                 return Container(
//                   height: 300,
//                   color: index % 2 == 0 ? Colors.red : Colors.teal,
//                   child: ListTile(
//                     title: Text(index.toString()),
//                     subtitle: Text(posts.toString()),
//                   ),
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.red,
//                   ),
//                 );
//               }
//             }));
//   }

//   Future<void> _scrollListener() async {
//     if (scrollController.position.pixels ==
//         scrollController.position.maxScrollExtent) {
//       setState(() {
//         _isLoading = true;
//       });
//       _currentPage = _currentPage + 1;
//       print('call');
//       await _fetchPosts();
//       setState(() {
//         _isLoading = false;
//       });
//     } else {
//       print("not call");
//     }
//   }
// }

// To parse this JSON data, do
//
//     final categoryModelById = categoryModelByIdFromJson(jsonString);

// import 'dart:convert';

// CategoryModelById categoryModelByIdFromJson(String str) =>
//     CategoryModelById.fromJson(json.decode(str));

// String categoryModelByIdToJson(CategoryModelById data) =>
//     json.encode(data.toJson());

// class CategoryModelById {
//   CategoryModelById({
//     this.data,
//     this.message,
//     this.status,
//     this.code,
//   });

//   final Data? data;
//   final String? message;
//   final int? status;
//   final int? code;

//   factory CategoryModelById.fromJson(Map<String, dynamic> json) =>
//       CategoryModelById(
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         message: json["message"],
//         status: json["status"],
//         code: json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//         "message": message,
//         "status": status,
//         "code": code,
//       };
// }

// class Data {
//   Data({
//     this.id,
//     this.name,
//     this.slug,
//     this.parentId,
//     this.icon,
//     this.description,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.contents,
//     this.tests,
//     this.topics,
//   });

//   final String? id;
//   final String? name;
//   final String? slug;
//   final dynamic parentId;
//   final String? icon;
//   final String? description;
//   final String? status;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic deletedAt;
//   final Contents? contents;
//   final List<Map<String, String?>>? tests;
//   final List<Topic>? topics;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         parentId: json["parentId"],
//         icon: json["icon"],
//         description: json["description"],
//         status: json["status"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         deletedAt: json["deletedAt"],
//         contents: json["contents"] == null
//             ? null
//             : Contents.fromJson(json["contents"]),
//         tests: json["tests"] == null
//             ? []
//             : List<Map<String, String?>>.from(json["tests"]!.map((x) =>
//                 Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
//         topics: json["topics"] == null
//             ? []
//             : List<Topic>.from(json["topics"]!.map((x) => Topic.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "parentId": parentId,
//         "icon": icon,
//         "description": description,
//         "status": status,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "deletedAt": deletedAt,
//         "contents": contents?.toJson(),
//         "tests": tests == null
//             ? []
//             : List<dynamic>.from(tests!.map((x) =>
//                 Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
//         "topics": topics == null
//             ? []
//             : List<dynamic>.from(topics!.map((x) => x.toJson())),
//       };
// }

// class Contents {
//   Contents({
//     this.contents,
//     this.pagination,
//   });

//   final List<CategoryContent>? contents;
//   final Pagination? pagination;

//   factory Contents.fromJson(Map<String, dynamic> json) => Contents(
//         contents: json["contents"] == null
//             ? []
//             : List<CategoryContent>.from(json["contents"]!.map((x) =>
//                 Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
//         pagination: json["pagination"] == null
//             ? null
//             : Pagination.fromJson(json["pagination"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "contents":
//             contents == null ? [] : List<dynamic>.from(contents!.map((x) => x)),
//         "pagination": pagination?.toJson(),
//       };
// }

// class CategoryContent {
//   CategoryContent({
//     this.id,
//     this.title,
//     this.slug,
//     this.status,
//     this.categoryId,
//     this.topicId,
//     this.ancestor,
//     this.descendant,
//     this.description,
//     this.createdAt,
//     this.updatedAt,
//     this.excerpt,
//     this.deletedAt,
//   });

//   final String? id;
//   final String? title;
//   final String? slug;
//   final String? status;
//   final String? categoryId;
//   final String? topicId;
//   final dynamic ancestor;
//   final dynamic descendant;
//   final String? description;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? excerpt;
//   final dynamic deletedAt;

//   factory CategoryContent.fromJson(Map<String, dynamic> json) =>
//       CategoryContent(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         status: json["status"],
//         categoryId: json["categoryId"],
//         topicId: json["topicId"],
//         ancestor: json["ancestor"],
//         descendant: json["descendant"],
//         description: json["description"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         excerpt: json['excerpt'],
//         deletedAt: json["deletedAt"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "status": status,
//         "categoryId": categoryId,
//         "topicId": topicId,
//         "ancestor": ancestor,
//         "descendant": descendant,
//         "description": description,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "excerpt": excerpt,
//         "deletedAt": deletedAt,
//       };
// }

// class Pagination {
//   Pagination({
//     this.currentPage,
//     this.totalPage,
//     this.hasNext,
//   });

//   final int? currentPage;
//   final int? totalPage;
//   final bool? hasNext;

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         currentPage: json["currentPage"],
//         totalPage: json["totalPage"],
//         hasNext: json["hasNext"],
//       );

//   Map<String, dynamic> toJson() => {
//         "currentPage": currentPage,
//         "totalPage": totalPage,
//         "hasNext": hasNext,
//       };
// }

// class Topic {
//   Topic({
//     this.id,
//     this.title,
//     this.description,
//     this.icon,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });

//   final String? id;
//   final String? title;
//   final String? description;
//   final String? icon;
//   final String? status;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic deletedAt;

//   factory Topic.fromJson(Map<String, dynamic> json) => Topic(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         icon: json["icon"],
//         status: json["status"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         deletedAt: json["deletedAt"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "icon": icon,
//         "status": status,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "deletedAt": deletedAt,
//       };
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen();

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _videoPlayerController;
  bool _isBuffering = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://static.videezy.com/system/resources/previews/000/004/199/original/A_large_rock_waterfall.mp4');
    _videoPlayerController!.addListener(() {
      if (_videoPlayerController!.value.isBuffering) {
        setState(() {
          _isBuffering = true;
        });
      } else {
        setState(() {
          _isBuffering = false;
        });
      }
    });
    _videoPlayerController!.initialize().then((_) {
      setState(() {});
      _videoPlayerController!.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController!),
            ),
            if (_isBuffering)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }
}
