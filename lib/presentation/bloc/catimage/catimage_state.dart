part of 'catimage_bloc.dart';

abstract class CatImageState {}

class CatImageInitial extends CatImageState {}

class CatImageLoading extends CatImageState {}

class CatImageLoaded extends CatImageState {
  final String imageUrl;

  CatImageLoaded(this.imageUrl);
}

class CatImageError extends CatImageState {
  final String error;

  CatImageError(this.error);
}
