import 'package:dio/dio.dart';
import 'package:online_learning_app/core/constants/api_constants.dart';
import 'package:online_learning_app/core/model/response_model.dart';
import 'package:online_learning_app/features/homepage/models/categoryModel.dart';
import 'package:online_learning_app/features/homepage/models/category_by_id_content.dart';
import 'package:online_learning_app/features/homepage/models/category_id_model.dart';
import 'package:online_learning_app/features/homepage/models/content_model.dart';

class CategoryRepository {
  final dio = Dio();
  Future<CategoryModel> fetchAllCategories() async {
    try {
      final response = await dio.get(APIConstants.getAllCategories);
      print(response.data);
      // if (response.statusCode == 200) {
      //   CategoryModel.fromJson(response.data);
      // }
      return CategoryModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<CategoryModelById> fetchCategoryById(String category_id) async {
    try {
      final response =
          await dio.get(APIConstants.getAllCategories + "/" + category_id);
      print(response.data);
      return CategoryModelById.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<CategoryByIdContent> fetchCategoryByIdContent(
      String content_id) async {
    try {
      final response =
          await dio.get(APIConstants.getContent + "/" + content_id);
      print(response.data);
      return CategoryByIdContent.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<List<ContentModel>> fetchContent() async {
    try {
      final response = await dio.get(APIConstants.getContent);

      return contentModelFromJson(response.data['data']['contents']);
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
