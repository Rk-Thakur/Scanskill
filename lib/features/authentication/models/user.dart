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
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String email;

  @HiveField(2)
  String token;

  UserModel({
    required this.id,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      token: json['token'],
      email: json['email'],
    );
  }
}
