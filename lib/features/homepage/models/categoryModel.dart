// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  const CategoryModel({
    required this.data,
    required this.message,
    required this.status,
    required this.code,
  });

  final Data? data;
  final String? message;
  final int? status;
  final int? code;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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

  static const CategoryModel empty =
      CategoryModel(data: null, message: null, status: null, code: null);
}

class Data {
  Data({
    required this.categories,
    required this.pagination,
  });

  List<Category> categories;
  Pagination pagination;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
    this.parentId,
    required this.icon,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.subCategories,
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
  final List<SubCategory>? subCategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parentId: json["parentId"],
        icon: json["icon"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parentId": parentId,
        "icon": icon,
        "description": description,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "subCategories":
            List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.parentId,
    required this.icon,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String? id;
  final String? name;
  final String? slug;
  final String? parentId;
  final String? icon;
  final String? description;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parentId: json["parent_id"],
        icon: json["icon"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent_id": parentId,
        "icon": icon,
        "description": description,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
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
