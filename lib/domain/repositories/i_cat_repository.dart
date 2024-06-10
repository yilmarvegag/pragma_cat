import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';

abstract class ICatRepository {
  Future<List<BreedEntity>> getAllBreeds();
  Future<String> fetchBreedImage(String referenceImageId);
}
