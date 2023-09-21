import 'package:app_movie/model/entity/movie_entity.dart';

class MovieResponse {
  MovieResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MovieResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieEntity.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? page;
  List<MovieEntity>? results;
  int? totalPages;
  int? totalResults;

  MovieResponse copyWith({
    int? page,
    List<MovieEntity>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MovieResponse(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
