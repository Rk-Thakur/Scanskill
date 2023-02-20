// import 'package:dio/dio.dart' as don;
// import 'package:online_learning_app/core/constants/api_constants.dart';

// export 'package:dio/dio.dart';

// class DioService {
//   factory DioService() => _instance;
//   DioService._internal();
//   static final DioService _instance = DioService._internal();
//   final don.Dio client = don.Dio();

//   Future<void> initialize() async {
//     client
//       ..options.baseUrl = APIConstants.baseUrl
//       ..interceptors.add(
//         don.InterceptorsWrapper(
//           onRequest: (requestOptions, requestInterceptorHandler) {
//             final _token = TokenService().getToken();
//             print('Bearer $_token');
//             if (_token != null) {
//               requestOptions.headers.addAll(
//                 <String, String>{
//                   'Authorization': 'Bearer $_token',
//                   'Content-Type': 'application/json'
//                 },
//               );
//             }
//             return requestInterceptorHandler.next(requestOptions);
//           },
//           onError:
//               (don.DioError error, don.ErrorInterceptorHandler errorHandler) {
//             errorHandler.next(error);
//           },
//         ),
//       );
//   }
// }
