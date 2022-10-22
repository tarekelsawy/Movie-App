import 'package:movie_app_with_clean_architecture/movies/domain/entities/genres.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    print('details json model');
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      genres: (json['genres'] as List)
          .map((genre) => Genres.fromJson(genre))
          .toList(),
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      voteAverage: json['vote_average'],
    );
  }
}
