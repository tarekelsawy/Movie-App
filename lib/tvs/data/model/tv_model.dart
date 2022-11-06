import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_entity.dart';

class TvModel extends TvEntity {
  const TvModel({
    super.backdropPath,
    required super.voteAverage,
    required super.overview,
    required super.id,
    required super.firstAirDate,
    required super.name,
    super.posterPath,
  });
  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        voteAverage: json['vote_average'],
        overview: json['overview'],
        id: json['id'],
        firstAirDate: json['first_air_date'],
        name: json['name'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
      );
}
