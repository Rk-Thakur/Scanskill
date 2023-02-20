import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/features/splash/splash.dart';
import 'package:online_learning_app/features/utils/router.dart';
import 'package:online_learning_app/testing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(390, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: primaryColor,
          ),
          debugShowCheckedModeBanner: false,
          // home: const Testing(),
          onGenerateRoute: appRouter.onGeneratorRoute,
        );
      },
    );
  }
}
