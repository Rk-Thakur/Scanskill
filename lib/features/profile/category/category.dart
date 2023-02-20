import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/features/homepage/view/homePage.dart';
import 'package:online_learning_app/features/homepage/widgets/data.dart';

import 'package:online_learning_app/core/ui/textStyle.dart';
import 'package:online_learning_app/features/profile/view/profileSetup.dart';
import 'package:page_transition/page_transition.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int? _selectedListIndex;
  List<int> selectedCatergory = [];

  onButtonTapped(int index) {
    setState(() {
      _selectedListIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 16.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Welcome! \nSelect Category ",
                  style: textStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
            ),
            SizedBox(
              height: 18.h,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: containerColor,
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: GridView.builder(
                    itemCount: button.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            onButtonTapped(index);
                            !selectedCatergory.contains(index + 1)
                                ? selectedCatergory.add(index + 1)
                                : selectedCatergory.remove(index + 1);
                          });
                        },
                        child: categoryBox(
                            icon: button[index].icon!,
                            name: button[index].name,
                            isClicked: selectedCatergory.contains(index + 1)),
                      );
                    },
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageTransition(
                      type: PageTransitionType.fade, child: const HomePage()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8.sp)),
                child: Center(
                    child: Text('Save',
                        style: textStyle(
                          fontSize: 16.sp,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column categoryBox(
      {required IconData icon, required String name, required bool isClicked}) {
    return Column(children: [
      Container(
        width: 75.w,
        height: 70.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: isClicked ? selectedColor : unselectedColor,
        ),
        child: Icon(
          icon,
          color: isClicked ? Colors.white : listIconColor,
          size: buttonSize,
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        name,
        style: textStyle(
            color: listTextColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
      )
    ]);
  }
}
