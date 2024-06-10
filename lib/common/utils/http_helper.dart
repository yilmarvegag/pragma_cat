import 'package:pragma_cat/common/utils/constanst.dart';
import 'package:http/http.dart';

class HttpHelper {
  final String? data;
  final String url;

  HttpHelper({this.data, required this.url});

  Future<Map<String, String>> getHeader({bool put = false}) async {
    Map<String, String> header = {'x-api-key': Constanst.apiKey};

    return header;
  }

  Future<Response> getAction() async {
    final uri = Uri.parse(url);
    return get(uri, headers: await getHeader());
  }
}
