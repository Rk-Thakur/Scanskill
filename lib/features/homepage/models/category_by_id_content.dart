// To parse this JSON data, do
//
//     final categoryByIdContent = categoryByIdContentFromJson(jsonString);

import 'dart:convert';

CategoryByIdContent categoryByIdContentFromJson(String str) =>
    CategoryByIdContent.fromJson(json.decode(str));

String categoryByIdContentToJson(CategoryByIdContent data) =>
    json.encode(data.toJson());

class CategoryByIdContent {
  const CategoryByIdContent({
    this.data,
    this.message,
    this.status,
    this.code,
  });

  final Data? data;
  final String? message;
  final int? status;
  final int? code;

  factory CategoryByIdContent.fromJson(Map<String, dynamic> json) =>
      CategoryByIdContent(
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
  static const CategoryByIdContent empty =
      CategoryByIdContent(data: null, message: null, status: null, code: null);
}

class Data {
  const Data({
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
    this.deletedAt,
    this.topic,
    this.category,
    this.tests,
    this.typeDescriptions,
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
  final String? deletedAt;
  final Topic? topic;
  final Category? category;
  final List<dynamic>? tests;
  final List<TypeDescription>? typeDescriptions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        deletedAt: json["deletedAt"],
        topic: json["topic"] == null ? null : Topic.fromJson(json["topic"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        tests: json["tests"] == null
            ? []
            : List<dynamic>.from(json["tests"]!.map((x) => x)),
        typeDescriptions: json["typeDescriptions"] == null
            ? []
            : List<TypeDescription>.from(json["typeDescriptions"]!
                .map((x) => TypeDescription.fromJson(x))),
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
        "deletedAt": deletedAt,
        "topic": topic?.toJson(),
        "category": category?.toJson(),
        "tests": tests == null ? [] : List<dynamic>.from(tests!.map((x) => x)),
        "typeDescriptions": typeDescriptions == null
            ? []
            : List<dynamic>.from(typeDescriptions!.map((x) => x.toJson())),
      };
}

class Category {
  const Category({
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
  final DateTime? deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
      };
}

class Topic {
  const Topic({
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
  final DateTime? deletedAt;

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

class TypeDescription {
  const TypeDescription({
    this.id,
    this.contentId,
    this.typeId,
    this.order,
    this.image,
    this.video,
    this.videoLink,
    this.article,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.imageUrl,
    this.type,
    this.videoUrl,
  });

  final String? id;
  final String? contentId;
  final String? typeId;
  final int? order;
  final String? image;
  final String? video;
  final String? videoLink;
  final dynamic article;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? imageUrl;
  final String? type;
  final String? videoUrl;

  factory TypeDescription.fromJson(Map<String, dynamic> json) =>
      TypeDescription(
        id: json["id"],
        contentId: json["contentId"],
        typeId: json["typeId"],
        order: json["order"],
        image: json["image"],
        video: json["video"],
        videoLink: json["videoLink"],
        article: json["article"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        imageUrl: json["imageUrl"],
        type: json["type"],
        videoUrl: json["videoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contentId": contentId,
        "typeId": typeId,
        "order": order,
        "image": image,
        "video": video,
        "videoLink": videoLink,
        "article": article,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "imageUrl": imageUrl,
        "type": type,
        "videoUrl": videoUrl,
      };
}
