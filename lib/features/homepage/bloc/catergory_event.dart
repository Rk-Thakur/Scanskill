// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'catergory_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  CategoryEvent();
  @override
  List<Object> get props => [];
}

class FetchAllCategoryEvent extends CategoryEvent {}

class FetchAllContentEvent extends CategoryEvent {}

class FetchMoreContentEvent extends CategoryEvent {}

class FetchCataegoryEventById extends CategoryEvent {
  final String category_id;
  FetchCataegoryEventById(
    this.category_id,
  );
}

class FetchMoreCataegoryEventById extends CategoryEvent {
  final String category_id;
  FetchMoreCataegoryEventById(
    this.category_id,
  );
}

class FetchCategoryByIdContentEvent extends CategoryEvent {
  final String content_id;
  FetchCategoryByIdContentEvent(this.content_id);
}
