import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/core/constants/color.dart';

import 'package:online_learning_app/core/ui/textStyle.dart';

import '../../../core/services/token_services.dart';
import '../../authentication/bloc/authentication_bloc.dart';

class appBarWidget extends StatelessWidget {
  const appBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final token = TokenService().getToken();

    return AppBar(
      backgroundColor: backGroundColor,
      centerTitle: true,
      elevation: 0,
      leadingWidth: 80,
      title: Text(
        "Discover",
        style: textStyle(
            color: appBarTextColor,
            letterSpacing: .3.sp,
            fontWeight: FontWeight.bold),
      ),
      // leading: Padding(
      //   padding: EdgeInsets.only(top: 5.sp),
      //   child: GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => StoryViewPage(
      //                     stories: stories,
      //                     name: 'ScanSkill',
      //                   )));
      //     },
      //     child: const CircleAvatar(
      //       backgroundImage: AssetImage(
      //         'assets/scanskill.jpeg',
      //       ),
      //     ),
      //   ),
      // ),
      actions: [
        token != null
            ? IconButton(
                icon: const CircleAvatar(
                  backgroundImage: AssetImage('assets/scanskill.jpeg'),
                  radius: 50,
                ),
                onPressed: () {
                  print("profile drawer open");
                  context
                      .read<AuthenticationBloc>()
                      .add(FetchUserProfileEvent());

                  Scaffold.of(context).openEndDrawer();
                },
              )
            : SizedBox.shrink()
      ],
    );
  }
}
