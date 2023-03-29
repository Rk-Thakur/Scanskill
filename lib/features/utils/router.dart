import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/features/authentication/auth_repository/auth_repository.dart';
import 'package:online_learning_app/features/authentication/bloc/authentication_bloc.dart';
import 'package:online_learning_app/features/authentication/view/loginPage.dart';
import 'package:online_learning_app/features/homepage/bloc/catergory_bloc.dart';
import 'package:online_learning_app/features/homepage/view/homePage.dart';
import 'package:online_learning_app/features/homepage/view/storyView.dart';
import 'package:online_learning_app/features/onBoarding/onBoard.dart';
import 'package:online_learning_app/features/splash/splash.dart';
import 'package:online_learning_app/features/utils/route.dart';

class AppRouter {
  final CategoryBloc categoryBloc = CategoryBloc();
  final AuthenticationBloc authenticationBloc;
  AppRouter({required this.authenticationBloc});
  final AuthRepository authRepository = AuthRepository();
  Route<dynamic> onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: authenticationBloc..add(CheckLoginEvent()),
              ),
            ],
            child: const SplashScreenPage(),
          );
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
              BlocProvider.value(
                value: authenticationBloc,
              ),
            ],
            child: const HomePage(),
          );
        });
      case storyScreen:
        return MaterialPageRoute(builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: categoryBloc,
              ),
            ],
            child: StoryViewPage(),
          );
        });
      case loginScreen:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider.value(
              value: authenticationBloc, child: LoginPage());
        });

      default:
        return notFoundRoute();
    }
  }

  void dispose() {
    categoryBloc.close();
    authenticationBloc.close();
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
