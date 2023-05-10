// To parse this JSON data, do

//     final contentModel = contentModelFromJson(jsonString);

import 'dart:convert';

ContentModel contentModelFromJson(String str) =>
    ContentModel.fromJson(json.decode(str));

String contentModelToJson(ContentModel data) => json.encode(data.toJson());

class ContentModel {
  const ContentModel({
    required this.data,
    required this.message,
    required this.status,
    required this.code,
  });

  final Data? data;
  final String? message;
  final int? status;
  final int? code;

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "status": status,
        "code": code,
      };
  static const ContentModel empty =
      ContentModel(data: null, message: null, status: null, code: null);
}

class Data {
  Data({
    required this.contents,
    required this.pagination,
  });

  final List<Content>? contents;
  final Pagination? pagination;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        contents: List<Content>.from(
            json["contents"].map((x) => Content.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "contents": List<dynamic>.from(contents!.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
      };
}

class Content {
  Content({
    required this.id,
    required this.title,
    required this.slug,
    required this.status,
    required this.categoryId,
    required this.topicId,
    this.ancestor,
    this.descendant,
    required this.description,
    required this.excerpt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String? id;
  final String? title;
  final String? slug;
  final String? status;
  final String? categoryId;
  final String? topicId;
  final String? ancestor;
  final String? descendant;
  final String? description;
  final String? excerpt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
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
        excerpt: json["excerpt"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "excerpt": excerpt,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Pagination {
  Pagination({
    required this.currentPage,
    required this.totalPage,
    required this.hasNext,
  });

  final int? currentPage;
  final int? totalPage;
  final bool? hasNext;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["currentPage"],
        totalPage: json["totalPage"],
        hasNext: json["hasNext"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalPage": totalPage,
        "hasNext": hasNext,
      };
}

// import 'dart:convert';

// List<ContentModel> contentModelFromJson(List<dynamic> str) =>
//     List<ContentModel>.from((str).map((x) => ContentModel.fromJson(x)));

// String contentModelToJson(List<ContentModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ContentModel {
//   ContentModel({
//     this.id,
//     this.title,
//     this.slug,
//     this.status,
//     this.categoryId,
//     this.topicId,
//     this.ancestor,
//     this.descendant,
//     this.description,
//     this.excerpt,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });

//   final String? id;
//   final String? title;
//   final String? slug;
//   final String? status;
//   final String? categoryId;
//   final String? topicId;
//   final String? ancestor;
//   final String? descendant;
//   final String? description;
//   final String? excerpt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic deletedAt;

//   factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         status: json["status"],
//         categoryId: json["categoryId"],
//         topicId: json["topicId"],
//         ancestor: json["ancestor"],
//         descendant: json["descendant"],
//         description: json["description"],
//         excerpt: json["excerpt"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         deletedAt: json["deletedAt"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "status": status,
//         "categoryId": categoryId,
//         "topicId": topicId,
//         "ancestor": ancestor,
//         "descendant": descendant,
//         "description": description,
//         "excerpt": excerpt,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "deletedAt": deletedAt,
//       };
// }
