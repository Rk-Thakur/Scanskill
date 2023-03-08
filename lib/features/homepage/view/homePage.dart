import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/features/homepage/models/categoryModel.dart';
import 'package:online_learning_app/features/homepage/view/drawer.dart';
import 'package:online_learning_app/features/homepage/widgets/appBarWidget.dart';
import 'package:online_learning_app/features/homepage/widgets/coursesList.dart';

import 'package:online_learning_app/core/ui/textStyle.dart';

import '../bloc/catergory_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isTapped = false;
  String? courseName;
  String? categoryId;
  bool isContent = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int? _selectedListIndex;

  onButtonTapped(int index) {
    setState(() {
      _selectedListIndex = index;
    });
  }

  @override
  void initState() {
    // final userState = context.watch<AuthenticationBloc>().state;
    // print(userState.userModel.isLogin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: const ProfileDrawer(),
      backgroundColor: backGroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: appBarWidget(),
      ),
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Column(
                          children: [
                            Center(
                              child: Text(
                                "Be yourself,be \n anything.",
                                textAlign: TextAlign.center,
                                style: textStyle(
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.bold,
                                    color: listTextColor),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ];
              },
              body: Column(
                children: [
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state.categoryStatus == CategoryStatus.loading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: iconColor,
                          ),
                        );
                      } else if (state.categoryStatus ==
                          CategoryStatus.success) {
                        return Container(
                          width: double.infinity,
                          height: 125.h,
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 0.w,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  state.categoryModel.data!.categories!.length,
                              itemBuilder: (context, index) {
                                final category = state
                                    .categoryModel.data!.categories![index];

                                return Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.sp, top: 5.sp),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          context.read<CategoryBloc>().add(
                                              FetchCataegoryEventById(
                                                  category.id!));
                                          setState(() {
                                            onButtonTapped(index);

                                            categoryId = category.id;
                                            isContent = true;

                                            // courseName = category.name;
                                          });
                                        },
                                        child: Column(children: [
                                          Container(
                                            width: 75.w,
                                            height: 70.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: _selectedListIndex == index
                                                  ? selectedColor
                                                  : unselectedColor,
                                            ),
                                            child: checkIcon(category, index),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Container(
                                            width: 95.w,
                                            height: 40.h,
                                            child: Text(
                                              "${category.name}",
                                              textAlign: TextAlign.center,
                                              style: textStyle(
                                                  color: listTextColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.sp, right: 20.sp, top: 0.sp),
                    child: Divider(
                      thickness: 2.sp,
                    ),
                  ),
                  Expanded(
                    child: CoursesList(
                      isContent: isContent,
                      categoryId: categoryId,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 56.h,
      //   // color: Colors.black,
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(FontAwesomeIcons.houseChimney),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           FontAwesomeIcons.magnifyingGlass,
      //         ),
      //         label: 'Search',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FontAwesomeIcons.calendar),
      //         label: 'Calendar',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FontAwesomeIcons.user),
      //         label: 'User',
      //       ),
      //     ],
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: _selectedIndex,
      //     selectedItemColor: navIconColor,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     unselectedItemColor: unselectedColor,
      //     // iconSize: 20,
      //     onTap: _onItemTapped,
      //   ),
      // ),
    );
  }

  Widget checkIcon(Category category, int index) {
    String icon = category.icon;
    var icons = icon.split('-');
    var iconName = icons[0];
    var iconType = icons[1].toLowerCase();
    switch (iconType) {
      case "brands":
        return Icon(
          IconDataBrands(int.parse('0x${iconName}')),
          color: _selectedListIndex == index ? Colors.white : listIconColor,
          size: buttonSize,
        );
      case "solid":
        return Icon(
          IconDataSolid(int.parse('0x${iconName}')),
          color: _selectedListIndex == index ? Colors.white : listIconColor,
          size: buttonSize,
        );
      case "regular":
        return Icon(
          IconDataRegular(int.parse('0x${iconName}')),
          color: _selectedListIndex == index ? Colors.white : listIconColor,
          size: buttonSize,
        );
      case "light":
        return Icon(
          IconDataLight(int.parse('0x${iconName}')),
          color: _selectedListIndex == index ? Colors.white : listIconColor,
          size: buttonSize,
        );
      case "duotone":
        return Icon(
          IconDataDuotone(int.parse('0x${iconName}')),
          color: _selectedListIndex == index ? Colors.white : listIconColor,
          size: buttonSize,
        );
      default:
        if (category.name!.length > 0) {
          final name = category.name![0];
          return Center(
            child: Text(
              "$name",
              style: textStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: _selectedListIndex == index
                      ? Colors.white
                      : listIconColor),
            ),
          );
        }
        return SizedBox.shrink();
    }
  }
}

class Butttontype {
  IconData? icon;
  String name;
  Butttontype({
    this.icon,
    required this.name,
  });
}

class CourseType {
  Icon? icon;
  String? courseTitle;
  String? courseDescription;
  int? courseCompleted;
  CourseType({
    this.icon,
    this.courseTitle,
    this.courseDescription,
    this.courseCompleted,
  });
}
