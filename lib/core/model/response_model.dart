import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  const ResponseModel({
    required this.data,
    required this.message,
    required this.status,
    required this.code,
  });

  final dynamic? data;
  final String? message;
  final int? status;
  final int? code;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        data: json["data"],
        message: json["message"],
        status: json["status"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "status": status,
        "code": code,
      };
  static const ResponseModel empty =
      ResponseModel(data: null, message: null, status: null, code: null);
}
