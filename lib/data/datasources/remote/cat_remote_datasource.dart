import 'package:pragma_cat/common/const_urls.dart';
import 'package:pragma_cat/common/utils/http_helper.dart';
import 'package:pragma_cat/data/models/cats/breed_model.dart';
import 'dart:convert';

class CatRemoteDataSourceImpl {
  CatRemoteDataSourceImpl();

  Future<List<BreedModel>> getAll() async {
    try {
      final response =
          await HttpHelper(url: ConstUrlEndpoint.breedsEndpoint).getAction();

      if (response.statusCode == 200) {
        List<BreedModel> breedList = [];
        List<dynamic> jsonList = [];
        jsonList = json.decode(response.body);
        for (var json in jsonList) {
          BreedModel breed = BreedModel.fromMap(json);
          breedList.add(breed);
        }
        return breedList;
      } else {
        throw Exception('Failed to load breeds');
      }
    } catch (e, stackTrace) {
      throw Exception('Failed to load breeds: $e');
    }
  }

  Future<String> getBreedImage(String referenceImageId) async {
    try {
      final response = await HttpHelper(
              url: ConstUrlEndpoint.breedsImageEndpoint(referenceImageId))
          .getAction();

      if (response.statusCode == 200) {
        return json.decode(response.body)['url'];
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e, stackTrace) {
      throw Exception('Failed to load image: $e');
    }
  }
}
