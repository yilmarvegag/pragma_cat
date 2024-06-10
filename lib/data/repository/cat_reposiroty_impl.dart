import 'package:pragma_cat/data/datasources/remote/cat_remote_datasource.dart';
import 'package:pragma_cat/data/models/cats/breed_model.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';

class CatRepositoryImpl implements ICatRepository {
  final CatRemoteDataSource _catRemoteDataSource;

  CatRepositoryImpl(this._catRemoteDataSource);

  @override
  Future<List<BreedModel>> getAllBreeds() async =>
      await _catRemoteDataSource.getAll();

  @override
  Future<String> fetchBreedImage(String referenceImageId) async =>
      await _catRemoteDataSource.getBreedImage(referenceImageId);
}
