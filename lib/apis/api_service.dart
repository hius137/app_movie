import 'package:app_movie/model/entity/movie_entity.dart';
import 'package:app_movie/model/response/movie_response.dart';
import 'package:dio/dio.dart';

Future<List<MovieEntity>?> requestPopularMovie() async {
  final Dio dio = Dio();
  try {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=97b7e81bbacb764ede3dc7212818e246');
    MovieResponse data = MovieResponse.fromJson(response.data);
    return data.results;
  } catch (e) {
    return null;
  }
}
Future<List<MovieEntity>?> requestUCMovie() async {
  final Dio dio = Dio();
  try {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=97b7e81bbacb764ede3dc7212818e246');
    MovieResponse data = MovieResponse.fromJson(response.data);
    return data.results;
  } catch (e) {
    return null;
  }
}