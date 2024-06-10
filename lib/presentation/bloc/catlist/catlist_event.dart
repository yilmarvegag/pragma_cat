part of 'catlist_bloc.dart';

abstract class CatListEvent {}

class LoadCatList extends CatListEvent {}

class RefreshCatList extends CatListEvent {}

class NavigateToDetail extends CatListEvent {
  final BreedEntity breed;
  final String imgUrl;

  NavigateToDetail({required this.breed, required this.imgUrl});
}

class NavigateBack extends CatListEvent {}
