/// {@template gif_services}
/// gif services
/// {@endtemplate}
///
import 'dart:convert';

import 'package:http/http.dart' as http;
class GifServices {
  /// {@macro gif_services}
  GifServices({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  final String baseUrl="api.giphy.com";
  final String endPoint="/v1/gifs/trending";
  final String apiKey="OL7EhlzICU9lqh3B72TJvzl5RlfLNgxT";
  
  Future<List<String>> getGifs()async{
    final uri = Uri.http(baseUrl, endPoint, {'api_key': apiKey});
    http.Response response;
    List gifs;

    try{
      response = await _client.get(uri);
    } on Exception{
      throw Exception("Error getting gifs");
    }
    if(response.statusCode != 200) {
      throw HttpRequestException();
    }

    try{
      gifs = jsonDecode(response.body)['data'] as List;
    } on Exception{
      throw JsonParseException();
    }
    return gifs.map((url) => url['images']['original']['url'].toString()).toList();
  }
}

class HttpRequestException implements Exception {}
class JsonParseException implements Exception {}
