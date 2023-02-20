import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:online_learning_app/features/homepage/models/categoryModel.dart';
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
      emit(state.copyWith(categoryStatus: CategoryStatus.loading));
      final categoryByIdResponse =
          await categoryRepository.fetchCategoryById(event.category_id);
      emit(state.copyWith(
          categoryModelById: categoryByIdResponse,
          categoryStatus: CategoryStatus.success));
    } catch (e) {
      emit(state.copyWith(categoryStatus: CategoryStatus.failure));
    }
  }

  void _fetchContent(
      FetchAllContentEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(state.copyWith(categoryStatus: CategoryStatus.loading));
      final contentResponse = await categoryRepository.fetchContent();
      emit(state.copyWith(
          contentModel: contentResponse,
          categoryStatus: CategoryStatus.success));
    } catch (e) {
      emit(state.copyWith(categoryStatus: CategoryStatus.failure));
    }
  }
}
