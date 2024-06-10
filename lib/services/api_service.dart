import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey =
      'ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';

  Future<List<dynamic>> fetchBreeds() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  Future<String> fetchBreedImage(String referenceImageId) async {
    // final response = await http.get(
    //   Uri.parse('https://api.thecatapi.com/v1/images/$referenceImageId'),
    //   headers: {
    //     'x-api-key': apiKey,
    //   },
    // );

    // if (response.statusCode == 200) {
    //   final data = json.decode(response.body);
    //   return data['url'];
    // } else {
    //   throw Exception('Failed to load image');
    // }
    return "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg";
  }
}
