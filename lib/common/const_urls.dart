const String urlBase = 'https://api.thecatapi.com/';

class ConstUrlEndpoint {
  static String _baseUrl({int version = 1}) => '$urlBase/v$version';

  ///1.1
  ///sing in
  static String breedsEndpoint = '${_baseUrl()}/breeds';

  ///1.1
  ///sing in
  static String breedsImageEndpoint(String referenceImageId) =>
      '${_baseUrl()}/images/$referenceImageId';
}
