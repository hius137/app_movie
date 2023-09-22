import 'package:app_movie/model/entity/actor_entity.dart';
import 'package:app_movie/model/entity/movie_entity.dart';
import 'package:app_movie/model/response/actor_response.dart';
import 'package:app_movie/model/response/detail_movie_response.dart';
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
Future<DetailMovieResponse?> requestDetailMovie(int movieId) async {
  final Dio dio = Dio();
  try {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=97b7e81bbacb764ede3dc7212818e246');
    DetailMovieResponse data = DetailMovieResponse.fromJson(response.data);
    return data;
  } catch (e) {
    return null;
  }
}

Future<List<Cast>?> requestCreditsMovie(int movieId) async {
  final Dio dio = Dio();
  try {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=97b7e81bbacb764ede3dc7212818e246');
    ActorResponse data = ActorResponse.fromJson(response.data);
    return data.cast;
  } catch (e) {
    return null;
  }
}
