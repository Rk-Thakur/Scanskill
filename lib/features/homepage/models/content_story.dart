// // To parse this JSON data, do
// //
// //     final contentStory = contentStoryFromJson(jsonString);

// import 'dart:convert';

// List<typeDescription> contentStoryFromJson(String str) =>
//     List<typeDescription>.from(
//         json.decode(str).map((x) => typeDescription.fromJson(x)));

// String contentStoryToJson(List<typeDescription> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class typeDescription {
//   typeDescription({
//     this.id,
//     this.contentId,
//     this.typeId,
//     this.order,
//     this.image,
//     this.video,
//     this.videoLink,
//     this.article,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.imageUrl,
//     this.type,
//   });

//   final String? id;
//   final String? contentId;
//   final String? typeId;
//   final int? order;
//   final String? image;
//   final dynamic video;
//   final dynamic videoLink;
//   final dynamic article;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic deletedAt;
//   final String? imageUrl;
//   final String? type;

//   factory typeDescription.fromJson(Map<String, dynamic> json) =>
//       typeDescription(
//         id: json["id"],
//         contentId: json["contentId"],
//         typeId: json["typeId"],
//         order: json["order"],
//         image: json["image"],
//         video: json["video"],
//         videoLink: json["videoLink"],
//         article: json["article"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         deletedAt: json["deletedAt"],
//         imageUrl: json["imageUrl"],
//         type: json["type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "contentId": contentId,
//         "typeId": typeId,
//         "order": order,
//         "image": image,
//         "video": video,
//         "videoLink": videoLink,
//         "article": article,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "deletedAt": deletedAt,
//         "imageUrl": imageUrl,
//         "type": type,
//       };
// }
