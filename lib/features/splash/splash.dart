import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/core/ui/textStyle.dart';
import 'package:online_learning_app/features/authentication/bloc/authentication_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    checkOnBoard();
  }

  Future<void> checkOnBoard() async {
    final onBoard = await TokenService().getOnBoard();
    if (onBoard == true) {
      Future.delayed(const Duration(seconds: 4),
          () => Navigator.pushNamed(context, '/home'));
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/onBoard', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/scanskill.jpeg",
                  height: 120.h,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text("Version 1.0",
                    style: textStyle(
                      fontSize: 12.sp,
                      height: 1.5,
                    )),
              ))
        ],
      ),
    );
  }
}
