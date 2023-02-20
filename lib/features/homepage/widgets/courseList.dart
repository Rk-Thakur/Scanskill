import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/core/ui/textStyle.dart';
import 'package:online_learning_app/features/homepage/widgets/data.dart';

GridView courseList(String? courseName) {
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          mainAxisExtent: 300.h),
      itemCount: course.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Container(
            width: 158.w,
            height: 175.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              // color: const Color(0xffE6E6E6),
              // color: Colors.red,
              // color: Colors.red,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 6,
                        margin: const EdgeInsets.only(top: 4),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(''),
                      ),
                      Container(
                        height: 6,
                        margin: const EdgeInsets.only(top: 4),
                        width: course[index].courseCompleted!.toDouble(),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        width: 50.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: backGroundColor,
                        ),
                        child: course[index].icon),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          courseName.toString(),
                          style: textStyle(
                            fontSize: 15.sp,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          course[index].courseDescription!,
                          style: textStyle(
                            fontSize: 10.sp,
                            height: 1.5,
                            color: const Color(0xff8E99A8),
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Completed",
                        style: textStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 149, 151, 154),
                        ),
                      ),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        course[index].courseCompleted.toString() + "%",
                        style: textStyle(
                          fontSize: 15.sp,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}


// class CourseList extends StatelessWidget {
//   const CourseList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView(
//           children: [
//             StaggeredGrid.count(
//               crossAxisCount: 4,
//               mainAxisSpacing: 2,
//               crossAxisSpacing: 4,
//               children: [
//                 StaggeredGridTile.count(
//                   mainAxisCellCount: 2,
//                   crossAxisCellCount: 2,
//                   child: imageContainer(
//                       'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                 ),
//                 StaggeredGridTile.count(
//                   mainAxisCellCount: 1,
//                   crossAxisCellCount: 2,
//                   child: imageContainer(
//                       'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                 ),
//                 StaggeredGridTile.count(
//                   mainAxisCellCount: 1,
//                   crossAxisCellCount: 2,
//                   child: imageContainer(
//                       'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                 ),
//                 StaggeredGridTile.count(
//                   mainAxisCellCount: 4,
//                   crossAxisCellCount: 4,
//                   child: imageContainer(
//                       'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                 ),
//                 StaggeredGridTile.count(
//                   mainAxisCellCount: 2,
//                   crossAxisCellCount: 2,
//                   child: imageContainer(
//                       'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                 ),
//                 StaggeredGridTile.count(
//                   mainAxisCellCount: 1,
//                   crossAxisCellCount: 2,
//                   child: imageContainer(
//                       'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                 ),
//                 StaggeredGridTile.count(
//                   mainAxisCellCount: 1,
//                   crossAxisCellCount: 2,
//                   child: imageContainer(
//                       'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                 ),
//                 StaggeredGridTile.count(
//                   mainAxisCellCount: 4,
//                   crossAxisCellCount: 4,
//                   child: imageContainer(
//                       'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// imageContainer(imgPath) {
//   return Container(
//     height: 200,
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Image.network(
//         imgPath,
//         height: 100,
//         width: 100,
//         fit: BoxFit.fill,
//       ),
//     ),
//   );
// }
