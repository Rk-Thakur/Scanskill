import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/core/services/dio_service.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/features/authentication/bloc/authentication_bloc.dart';

import 'package:online_learning_app/features/utils/router.dart';
import 'package:path_provider/path_provider.dart';

import 'core/model/network_connection.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox<String>('tokenbox');
  await Hive.openBox<bool>('onBoardBox');

  GetIt.I.registerSingleton(
      NetworkConnection(isConnected: true, isNavigated: false));
  await TokenService().initializePrefs();
  await DioService().initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AuthenticationBloc authenticationBloc = AuthenticationBloc();
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter =
        AppRouter(authenticationBloc: authenticationBloc);
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
          onGenerateRoute: appRouter.onGeneratorRoute,
        );
      },
    );
  }
}
