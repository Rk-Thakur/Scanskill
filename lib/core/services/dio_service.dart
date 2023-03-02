import 'package:dio/dio.dart' as don;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:online_learning_app/core/constants/api_constants.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/core/ui/no_internet.dart';
import 'package:page_transition/page_transition.dart';

import '../../main.dart';
import '../model/network_connection.dart';

export 'package:dio/dio.dart';

class DioService {
  factory DioService() => _instance;
  DioService._internal();
  static final DioService _instance = DioService._internal();
  final don.Dio client = don.Dio();

  Future<void> initialize() async {
    client
      ..options.baseUrl = APIConstants.hostUrl
      ..interceptors.add(
        don.InterceptorsWrapper(
          onRequest: (requestOptions, requestInterceptorHandler) async {
            // check this for the internet connection
            final connectionState = GetIt.I.get<NetworkConnection>();

            if ((!connectionState.isConnected) &&
                (!connectionState.isNavigated)) {
              GetIt.I.get<NetworkConnection>().isNavigated = true;
              Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
                  builder: (context) => const NoInternetPage()));
            } else {
              final _token = await TokenService().getToken();

              if ((_token == null || _token.isEmpty)) {
                requestOptions.headers.addAll(
                  <String, String>{
                    'Content-Type': 'application/json',
                    'Accept': 'text/plain'
                  },
                );
              } else {
                requestOptions.headers.addAll(
                  <String, String>{
                    'Authorization': 'Bearer $_token',
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                  },
                );
              }
            }
            return requestInterceptorHandler.next(requestOptions);
          },
          // onError:
          //     (don.DioError error, don.ErrorInterceptorHandler handler) async {
          //   if ((error.response?.statusCode == 401)) {
          //     Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          //         PageTransition(
          //             child: LoginPage(), type: PageTransitionType.fade),
          //         (route) => false);
          //   }
          //   handler.next(error);
          // }
        ),
      );
  }
}
