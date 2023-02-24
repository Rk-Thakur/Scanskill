// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'catergory_bloc.dart';

enum CategoryStatus { initial, loading, success, failure }

enum ContentStatus { initial, loading, success, failure }

enum CategoryByIdContentStatus { initial, loading, success, failure }

enum CategoryByIdStatus { initial, loading, success, failure }

class CategoryState extends Equatable {
  final CategoryStatus categoryStatus;
  final ContentStatus contentStatus;
  final CategoryByIdStatus categoryByIdStatus;
  final CategoryByIdContentStatus categoryByIdContentStatus;

  final CategoryModel categoryModel;
  final CategoryModelById categoryModelById;
  final CategoryByIdContent categoryByIdContent;
  final List<ContentModel> contentModel;

  CategoryState(
      {this.categoryStatus = CategoryStatus.initial,
      this.contentStatus = ContentStatus.initial,
      this.categoryByIdStatus = CategoryByIdStatus.initial,
      this.categoryByIdContentStatus = CategoryByIdContentStatus.initial,
      this.categoryModel = CategoryModel.empty,
      this.categoryModelById = CategoryModelById.empty,
      this.contentModel = const [],
      this.categoryByIdContent = CategoryByIdContent.empty});

  CategoryState copyWith(
      {CategoryStatus? categoryStatus,
      ContentStatus? contentStatus,
      CategoryByIdStatus? categoryByIdStatus,
      CategoryByIdContentStatus? categoryByIdContentStatus,
      CategoryModel? categoryModel,
      CategoryModelById? categoryModelById,
      List<ContentModel>? contentModel,
      CategoryByIdContent? categoryByIdContent}) {
    return CategoryState(
        categoryStatus: categoryStatus ?? this.categoryStatus,
        contentStatus: contentStatus ?? this.contentStatus,
        categoryByIdStatus: categoryByIdStatus ?? this.categoryByIdStatus,
        categoryByIdContentStatus:
            categoryByIdContentStatus ?? this.categoryByIdContentStatus,
        categoryModel: categoryModel ?? this.categoryModel,
        categoryModelById: categoryModelById ?? this.categoryModelById,
        contentModel: contentModel ?? this.contentModel,
        categoryByIdContent: categoryByIdContent ?? this.categoryByIdContent);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoryModel,
        contentStatus,
        categoryByIdStatus,
        categoryByIdContentStatus,
        categoryStatus,
        categoryModelById,
        contentModel,
        categoryByIdContent
      ];
}
