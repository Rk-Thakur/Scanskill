import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_learning_app/core/services/dio_service.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/features/authentication/models/user.dart';
import 'package:online_learning_app/features/homepage/models/userProfileModel.dart';
import 'package:online_learning_app/features/homepage/models/user_model.dart';

import '../../../core/constants/api_constants.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

class AuthRepository {
  final dio = Dio();
  final fbAuth.FirebaseAuth _auth = fbAuth.FirebaseAuth.instance;
  FacebookAuth auth = FacebookAuth.instance;

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
      final data = {'id_token': firebaseIdToken};

      final response = await DioService()
          .client
          .post(APIConstants.socialLogin, data: {'data': data});

      await TokenService().saveToken(response.data!['data']['token'], true);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult =
          await auth.login(permissions: ['email', 'public_profile']);
      final fbAuth.OAuthCredential facebookAuthCredential =
          fbAuth.FacebookAuthProvider.credential(
              loginResult.accessToken!.token);
      final fbAuth.UserCredential authResult = await fbAuth
          .FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      String firebaseIdToken = await _auth.currentUser!.getIdToken();

      final data = {'id_token': firebaseIdToken};

      final response = await DioService()
          .client
          .post(APIConstants.socialLogin, data: {'data': data});
      await TokenService().saveToken(response.data!['data']['token'], true);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<UserProfileModel> fetchUserProfile() async {
    try {
      final response = await DioService().client.get(APIConstants.userProfile);
      return UserProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<void> logOut() async {
    try {
      await DioService().client.post(APIConstants.logout);
      TokenService().removeToken();
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<bool> checkifEmailInUse(fbAuth.AuthCredential credential) async {
    try {
      final list = await fbAuth.FirebaseAuth.instance.currentUser!
          .linkWithCredential(credential);
      return true;
    } on fbAuth.FirebaseAuthException catch (e) {
      return false;
    }
  }
}
