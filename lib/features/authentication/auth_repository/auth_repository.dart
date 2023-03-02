import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_learning_app/core/services/dio_service.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/features/authentication/models/user.dart';
import 'package:online_learning_app/features/homepage/models/user_model.dart';

import '../../../core/constants/api_constants.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

class AuthRepository {
  final dio = Dio();
  final fbAuth.FirebaseAuth _auth = fbAuth.FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = fbAuth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await _auth.signInWithCredential(credential);
      String firebaseIdToken = await _auth.currentUser!.getIdToken();
      final data = {'idToken': firebaseIdToken};
      print(firebaseIdToken);

      final response = await DioService()
          .client
          .post(APIConstants.socialLogin, data: {'data': data});

      // final newUser = UserModel.fromJson(response.data['data']);

      // await TokenService().saveToken(response.data!['data']['token'], true);
      // return newUser;
      print(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  void logOut() async {
    TokenService().removeToken();
  }
}
