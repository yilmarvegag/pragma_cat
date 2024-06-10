part of 'catlist_bloc.dart';

abstract class CatListState {}

final class CatListInitial extends CatListState {}

class CatListLoading extends CatListState {}

class CatListLoaded extends CatListState {
  final List<BreedEntity> cats;

  CatListLoaded({required this.cats});
}

class CatListError extends CatListState {
  final String error;

  CatListError({required this.error});
}

class CatListNavigating extends CatListState {
  final BreedEntity breed;
  final String imgUrl;

  CatListNavigating({required this.breed, required this.imgUrl});
}
