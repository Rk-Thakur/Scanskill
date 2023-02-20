// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'catergory_bloc.dart';

enum CategoryStatus { initial, loading, success, failure }

class CategoryState extends Equatable {
  final CategoryStatus categoryStatus;
  final CategoryModel categoryModel;
  final CategoryModelById categoryModelById;
  final List<ContentModel> contentModel;
  CategoryState(
      {this.categoryStatus = CategoryStatus.initial,
      this.categoryModel = CategoryModel.empty,
      this.categoryModelById = CategoryModelById.empty,
      this.contentModel = const []});

  CategoryState copyWith(
      {CategoryStatus? categoryStatus,
      CategoryModel? categoryModel,
      CategoryModelById? categoryModelById,
      List<ContentModel>? contentModel}) {
    return CategoryState(
        categoryStatus: categoryStatus ?? this.categoryStatus,
        categoryModel: categoryModel ?? this.categoryModel,
        categoryModelById: categoryModelById ?? this.categoryModelById,
        contentModel: contentModel ?? this.contentModel);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [categoryModel, categoryStatus, categoryModelById, contentModel];
}
