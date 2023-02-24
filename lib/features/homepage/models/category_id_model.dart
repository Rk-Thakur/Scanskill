// import 'dart:convert';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // To parse this JSON data, do
// //
// //     final categoryModelById = categoryModelByIdFromJson(jsonString);

// import 'dart:convert';

// CategoryModelById categoryModelByIdFromJson(String str) =>
//     CategoryModelById.fromJson(json.decode(str));

// String categoryModelByIdToJson(CategoryModelById data) =>
//     json.encode(data.toJson());

// class CategoryModelById {
//   const CategoryModelById({
//     required this.data,
//     required this.message,
//     required this.status,
//     required this.code,
//   });

//   final Data? data;
//   final String? message;
//   final int? status;
//   final int? code;

//   factory CategoryModelById.fromJson(Map<String, dynamic> json) =>
//       CategoryModelById(
//         data: Data.fromJson(json["data"]),
//         message: json["message"],
//         status: json["status"],
//         code: json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data!.toJson(),
//         "message": message,
//         "status": status,
//         "code": code,
//       };
//   static const CategoryModelById empty =
//       CategoryModelById(data: null, message: null, status: null, code: null);
// }

// class Data {
//   Data({
//     required this.id,
//     required this.name,
//     required this.slug,
//     this.parentId,
//     required this.icon,
//     required this.description,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//     required this.contents,
//     required this.tests,
//     required this.topics,
//   });

//   final String? id;
//   final String? name;
//   final String? slug;
//   final dynamic? parentId;
//   final String? icon;
//   final String? description;
//   final String? status;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic deletedAt;
//   final List<dynamic>? contents;
//   final List<dynamic>? tests;
//   final List<Topic>? topics;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         parentId: json["parentId"],
//         icon: json["icon"],
//         description: json["description"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         deletedAt: json["deletedAt"],
//         contents: List<dynamic>.from(json["contents"].map((x) => x)),
//         tests: List<dynamic>.from(json["tests"].map((x) => x)),
//         topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "parentId": parentId,
//         "icon": icon,
//         "description": description,
//         "status": status,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "deletedAt": deletedAt,
//         "contents": List<dynamic>.from(contents!.map((x) => x)),
//         "tests": List<dynamic>.from(tests!.map((x) => x)),
//         "topics": List<dynamic>.from(topics!.map((x) => x.toJson())),
//       };
// }

// class Topic {
//   Topic({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.icon,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//   });

//   final String? id;
//   final String? title;
//   final String? description;
//   final String? icon;
//   final String? status;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic deletedAt;

//   factory Topic.fromJson(Map<String, dynamic> json) => Topic(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         icon: json["icon"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         deletedAt: json["deletedAt"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "icon": icon,
//         "status": status,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "deletedAt": deletedAt,
//       };
// }

// To parse this JSON data, do
//
//     final categoryModelById = categoryModelByIdFromJson(jsonString);

import 'dart:convert';

CategoryModelById categoryModelByIdFromJson(String str) =>
    CategoryModelById.fromJson(json.decode(str));

String categoryModelByIdToJson(CategoryModelById data) =>
    json.encode(data.toJson());

class CategoryModelById {
  const CategoryModelById({
    this.data,
    this.message,
    this.status,
    this.code,
  });

  final Data? data;
  final String? message;
  final int? status;
  final int? code;

  factory CategoryModelById.fromJson(Map<String, dynamic> json) =>
      CategoryModelById(
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
  static const CategoryModelById empty =
      CategoryModelById(data: null, message: null, status: null, code: null);
}

class Data {
  Data({
    this.id,
    this.name,
    this.slug,
    this.parentId,
    this.icon,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.contents,
    this.tests,
    this.topics,
  });

  final String? id;
  final String? name;
  final String? slug;
  final dynamic parentId;
  final String? icon;
  final String? description;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final List<Content>? contents;
  final List<dynamic>? tests;
  final List<Topic>? topics;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parentId: json["parentId"],
        icon: json["icon"],
        description: json["description"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        contents: json["contents"] == null
            ? []
            : List<Content>.from(
                json["contents"]!.map((x) => Content.fromJson(x))),
        tests: json["tests"] == null
            ? []
            : List<dynamic>.from(json["tests"]!.map((x) => x)),
        topics: json["topics"] == null
            ? []
            : List<Topic>.from(json["topics"]!.map((x) => Topic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parentId": parentId,
        "icon": icon,
        "description": description,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "contents": contents == null
            ? []
            : List<dynamic>.from(contents!.map((x) => x.toJson())),
        "tests": tests == null ? [] : List<dynamic>.from(tests!.map((x) => x)),
        "topics": topics == null
            ? []
            : List<dynamic>.from(topics!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.id,
    this.title,
    this.slug,
    this.status,
    this.categoryId,
    this.topicId,
    this.ancestor,
    this.descendant,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.excerpt,
    this.deletedAt,
  });

  final String? id;
  final String? title;
  final String? slug;
  final String? status;
  final String? categoryId;
  final String? topicId;
  final dynamic ancestor;
  final dynamic descendant;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? excerpt;
  final dynamic deletedAt;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        status: json["status"],
        categoryId: json["categoryId"],
        topicId: json["topicId"],
        ancestor: json["ancestor"],
        descendant: json["descendant"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        excerpt: json['excerpt'],
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "status": status,
        "categoryId": categoryId,
        "topicId": topicId,
        "ancestor": ancestor,
        "descendant": descendant,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "excerpt": excerpt,
        "deletedAt": deletedAt,
      };
}

class Topic {
  Topic({
    this.id,
    this.title,
    this.description,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? icon;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        icon: json["icon"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "icon": icon,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
