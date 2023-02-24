import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:online_learning_app/features/homepage/models/categoryModel.dart';
import 'package:online_learning_app/features/homepage/models/category_by_id_content.dart';
import 'package:online_learning_app/features/homepage/models/content_model.dart';
import 'package:online_learning_app/features/homepage/respository/category_respository.dart';

import '../models/category_id_model.dart';

part 'catergory_event.dart';
part 'catergory_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository = CategoryRepository();
  CategoryBloc() : super(CategoryState()) {
    on<FetchAllCategoryEvent>(_fetchAllCategory);
    on<FetchCataegoryEventById>(_fetchCategoryById);
    on<FetchAllContentEvent>(_fetchContent);
    on<FetchCategoryByIdContentEvent>(_fetchCategoryByIdContent);
  }

  void _fetchAllCategory(
      FetchAllCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(state.copyWith(categoryStatus: CategoryStatus.loading));
      final categoryResponse = await categoryRepository.fetchAllCategories();
      emit(state.copyWith(
          categoryModel: categoryResponse,
          categoryStatus: CategoryStatus.success));
    } catch (e) {
      emit(state.copyWith(categoryStatus: CategoryStatus.failure));
    }
  }

  void _fetchCategoryById(
      FetchCataegoryEventById event, Emitter<CategoryState> emit) async {
    try {
      emit(state.copyWith(categoryByIdStatus: CategoryByIdStatus.loading));
      final categoryByIdResponse =
          await categoryRepository.fetchCategoryById(event.category_id);
      emit(state.copyWith(
          categoryModelById: categoryByIdResponse,
          categoryByIdStatus: CategoryByIdStatus.success));
    } catch (e) {
      emit(state.copyWith(categoryByIdStatus: CategoryByIdStatus.failure));
    }
  }

  void _fetchContent(
      FetchAllContentEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(state.copyWith(contentStatus: ContentStatus.loading));
      final contentResponse = await categoryRepository.fetchContent();
      emit(state.copyWith(
          contentModel: contentResponse, contentStatus: ContentStatus.success));
    } catch (e) {
      emit(state.copyWith(contentStatus: ContentStatus.failure));
    }
  }

  void _fetchCategoryByIdContent(
      FetchCategoryByIdContentEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(state.copyWith(
          categoryByIdContentStatus: CategoryByIdContentStatus.loading));
      final categoryByIdContent =
          await categoryRepository.fetchCategoryByIdContent(event.content_id);
      emit(state.copyWith(
          categoryByIdContent: categoryByIdContent,
          categoryByIdContentStatus: CategoryByIdContentStatus.success));
    } catch (e) {
      emit(state.copyWith(
          categoryByIdContentStatus: CategoryByIdContentStatus.failure));
    }
  }
}
