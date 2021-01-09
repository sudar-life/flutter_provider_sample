import 'dart:convert';

import 'package:flutter_provider_sample/src/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Movie>> loadMovies() async {
    var queryParameters = {
      'api_key': '<your api key>'
    }; // https://www.themoviedb.org/ 제공하는 api key
    var uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', queryParameters);
    var response = await http.get(uri);
    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
      }
    }
  }
}
