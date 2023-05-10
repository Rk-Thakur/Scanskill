import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:online_learning_app/core/services/token_services.dart';
import 'package:online_learning_app/features/homepage/models/categoryModel.dart';
import 'package:online_learning_app/features/homepage/models/category_by_id_content.dart';
import 'package:online_learning_app/features/homepage/models/content_model.dart';
import 'package:online_learning_app/features/homepage/respository/category_respository.dart';

import '../models/category_id_model.dart';

part 'catergory_event.dart';
part 'catergory_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  int page = 1;
  bool isLoading = false;
  List<Content>? addedList;
  List<Content>? added;

  String? categoryId;

  ScrollController scrollController = ScrollController();
  ScrollController scrollCategoryController = ScrollController();
  final token = TokenService().getToken();

  final CategoryRepository categoryRepository = CategoryRepository();
  CategoryBloc() : super(CategoryState()) {
    scrollController.addListener(() {
      add(FetchMoreContentEvent());
    });
    scrollCategoryController.addListener(() {
      add(FetchCataegoryEventById(categoryId!));
    });

    on<FetchAllCategoryEvent>(_fetchAllCategory);
    on<FetchCataegoryEventById>(_fetchCategoryById);
    on<FetchMoreCataegoryEventById>(_fetchMoreCategoryById);
    on<FetchAllContentEvent>(_fetchContent);
    on<FetchMoreContentEvent>(_fetchMoreContent);
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
      categoryId = event.category_id;
      emit(state.copyWith(
          category: categoryByIdResponse.data!.contents!.contents!,
          categoryModelById: categoryByIdResponse,
          categoryByIdStatus: CategoryByIdStatus.success));
    } catch (e) {
      emit(state.copyWith(categoryByIdStatus: CategoryByIdStatus.failure));
    }
  }

  void _fetchMoreCategoryById(
      FetchMoreCataegoryEventById event, Emitter<CategoryState> emit) async {
    try {
      if (scrollCategoryController.position.pixels ==
          scrollCategoryController.position.maxScrollExtent) {
        isLoading = true;
        bool hasNext =
            state.categoryModelById.data!.contents!.pagination!.hasNext!;

        if (hasNext) {
          page++;
          final categoryByIdResponse = await categoryRepository
              .fetchCategoryById(event.category_id, page: page);
          emit(state.copyWith(
              category: [
                ...state.category!,
                ...categoryByIdResponse.data!.contents!.contents!
              ],
              categoryModelById: categoryByIdResponse,
              categoryByIdStatus: CategoryByIdStatus.success));
        }
      }
    } catch (e) {
      emit(state.copyWith(categoryByIdStatus: CategoryByIdStatus.failure));
    }
  }

  void _fetchContent(
      FetchAllContentEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(state.copyWith(
        contentStatus: ContentStatus.loading,
      ));
      final contentResponse = await categoryRepository.fetchContent(page: page);

      emit(state.copyWith(
          content: contentResponse.data!.contents!,
          contentModel: contentResponse,
          contentStatus: ContentStatus.success));
    } catch (e) {
      emit(state.copyWith(contentStatus: ContentStatus.failure));
    }
  }

  void _fetchMoreContent(
      FetchMoreContentEvent event, Emitter<CategoryState> emit) async {
    try {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        bool hasNext = state.contentModel.data!.pagination!.hasNext!;
        if (hasNext) {
          page++;
          // emit(state.copyWith(contentStatus: ContentStatus.fetchingMore));

          final contentResponse =
              await categoryRepository.fetchContent(page: page);

          emit(state.copyWith(
              content: [...state.content, ...contentResponse.data!.contents!],
              contentModel: contentResponse,
              contentStatus: ContentStatus.success));
        }
      }
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
