import 'package:online_learning_app/core/constants/api_constants.dart';
import 'package:online_learning_app/core/services/dio_service.dart';
import 'package:online_learning_app/features/homepage/models/categoryModel.dart';
import 'package:online_learning_app/features/homepage/models/category_by_id_content.dart';
import 'package:online_learning_app/features/homepage/models/category_id_model.dart';
import 'package:online_learning_app/features/homepage/models/content_model.dart';

class CategoryRepository {
  final dio = Dio();
  Future<CategoryModel> fetchAllCategories() async {
    try {
      final response =
          await DioService().client.get(APIConstants.getAllCategories);
      print(response.data);

      return CategoryModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<CategoryModelById> fetchCategoryById(String category_id,
      {int? page}) async {
    try {
      final response = await DioService().client.get(
        APIConstants.getAllCategories + "/" + category_id,
        queryParameters: {"limit": 7, "page": page},
      );
      print(
          'http://app.scanskill.com/public/api/category/$category_id?limit=7&page=$page');
      print(response.data);

      return CategoryModelById.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<CategoryByIdContent> fetchCategoryByIdContent(String content_id,
      {int? page}) async {
    try {
      final response = await DioService().client.get(
            APIConstants.getContent + "/" + content_id,
          );

      print(response.data);
      return CategoryByIdContent.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<ContentModel> fetchContent({int? page}) async {
    try {
      final response = await DioService().client.get(APIConstants.getContent,
          queryParameters: {"limit": 7, "page": page});
      print('http://app.scanskill.com/public/api/content?limit=7&page=$page');
      print(response.data);
      return ContentModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
