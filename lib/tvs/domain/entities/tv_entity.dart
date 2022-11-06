import 'package:equatable/equatable.dart';

class TvEntity extends Equatable {
  final int id;
  final String overview;
  final String name;
  final String? backdropPath;
  final String firstAirDate;
  final String? posterPath;
  final num voteAverage;

  const TvEntity({
    required this.id,
    required this.overview,
    required this.name,
    required this.backdropPath,
    required this.firstAirDate,
    required this.posterPath,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        overview,
        name,
        backdropPath,
        firstAirDate,
        posterPath,
        voteAverage,
      ];
}
