part of 'catimage_bloc.dart';

abstract class CatImageEvent {}

class LoadCatImage extends CatImageEvent {
  final String referenceImageId;

  LoadCatImage(this.referenceImageId);
}
