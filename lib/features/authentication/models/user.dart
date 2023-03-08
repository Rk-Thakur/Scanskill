// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class User {
//   final String name;
//   final String image;
//   const User({
//     required this.name,
//     required this.image,
//   });

//   factory User.fromJson(Map<String, dynamic> json) =>
//       User(name: json['name'], image: json['image']);
// }
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:online_learning_app/features/homepage/view/quizPlay.dart';

// part 'user.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? email;

  @HiveField(2)
  final String? token;

  // @HiveField(3)
  // final bool? isLogin;

  const UserModel({
    required this.id,
    required this.email,
    required this.token,
    // required this.isLogin
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      token: json['token'],
      email: json['email'],
      // isLogin: false,
    );
  }

  static const UserModel empty =
      // UserModel(id: null, email: null, token: null, isLogin: null);
      UserModel(id: null, email: null, token: null);
}
