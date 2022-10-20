import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.title,
    required super.backDropPath,
    required super.overview,
    required super.voteAverage,
    required super.genreIds,
    required super.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backDropPath: json['backdrop_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        genreIds: json['genre_ids'],
        releaseDate: json['release_date'],
      );
}
