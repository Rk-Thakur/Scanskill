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

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  List<ButtonType> button = [
    ButtonType(icon: FontAwesomeIcons.aws, name: 'Aws'),
    ButtonType(icon: FontAwesomeIcons.aws, name: 'Aws'),
    ButtonType(icon: FontAwesomeIcons.aws, name: 'Aws'),
    ButtonType(icon: FontAwesomeIcons.aws, name: 'Aws'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              itemCount: button.length,
              itemBuilder: (context, index) {
                return IconButton(
                    onPressed: () {}, icon: Icon(button[index].icon));
              })
        ],
      ),
    );
  }
}

class ButtonType {
  IconData icon;
  String name;
  ButtonType({
    required this.icon,
    required this.name,
  });
}
