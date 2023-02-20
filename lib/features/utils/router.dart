import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/features/homepage/bloc/catergory_bloc.dart';
import 'package:online_learning_app/features/homepage/view/homePage.dart';
import 'package:online_learning_app/features/onBoarding/onBoard.dart';
import 'package:online_learning_app/features/splash/splash.dart';
import 'package:online_learning_app/features/utils/route.dart';

class AppRouter {
  final CategoryBloc categoryBloc = CategoryBloc();
  Route<dynamic> onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) {
          return const SplashScreenPage();
        });
      case onBoardScreen:
        return MaterialPageRoute(builder: (_) {
          return const OnBoardingPage();
        });
      case homeScreen:
        return MaterialPageRoute(builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: categoryBloc..add(FetchAllCategoryEvent()),
              ),
              BlocProvider.value(
                value: categoryBloc..add(FetchAllContentEvent()),
              ),
            ],
            child: const HomePage(),
          );
        });

      default:
        return notFoundRoute();
    }
  }

  void dispose() {
    categoryBloc.close();
  }
}

Route notFoundRoute() {
  return MaterialPageRoute<Material>(
    builder: (context) => const Material(
      child: Scaffold(
        body: Center(
          child: Text('Page Not Found'),
        ),
      ),
    ),
  );
}
