import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_cat/data/datasources/remote/cat_remote_datasource.dart';

void main() {
  test('fetchBreeds returns a list of breeds', () async {
    CatRemoteDataSourceImpl remoteData = CatRemoteDataSourceImpl();
    var breeds = await remoteData.getAll();
    expect(breeds.isNotEmpty, true);
  });

  test('fetch get image, return link address', () async {
    CatRemoteDataSourceImpl remoteData = CatRemoteDataSourceImpl();
    var breeds = await remoteData.getBreedImage("JFPROfGtQ");
    expect(breeds.isNotEmpty, true);
  });
}
