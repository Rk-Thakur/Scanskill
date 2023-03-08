// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  const UserProfileModel({
    required this.data,
    required this.message,
    required this.status,
    required this.code,
  });

  final Data? data;
  final String? message;
  final int? status;
  final int? code;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
        "code": code,
      };

  static const UserProfileModel empty =
      UserProfileModel(data: null, message: null, status: null, code: null);
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.registrationType,
    required this.address,
    required this.status,
    required this.roleId,
    required this.phone,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userRole,
  });

  final String? id;
  final String? firstName;
  final dynamic middleName;
  final String? lastName;
  final String? email;
  final String? registrationType;
  final dynamic address;
  final String? status;
  final String? roleId;
  final dynamic phone;
  final int? emailVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? userRole;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        registrationType: json["registrationType"],
        address: json["address"],
        status: json["status"],
        roleId: json["roleId"],
        phone: json["phone"],
        emailVerified: json["emailVerified"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userRole: json["userRole"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "email": email,
        "registrationType": registrationType,
        "address": address,
        "status": status,
        "roleId": roleId,
        "phone": phone,
        "emailVerified": emailVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "userRole": userRole,
      };
}
