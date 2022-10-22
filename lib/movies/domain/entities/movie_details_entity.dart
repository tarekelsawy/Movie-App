import 'package:equatable/equatable.dart';

import 'package:movie_app_with_clean_architecture/movies/domain/entities/genres.dart';

class MovieDetailsEntity extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  const MovieDetailsEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });

  

  @override
  List<Object> get props {
    return [
      backdropPath,
      genres,
      id,
      title,
      overview,
      releaseDate,
      runtime,
      voteAverage,
    ];
  }
}
