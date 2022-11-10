import 'package:equatable/equatable.dart';

import 'tv_details_genres.dart';
import 'tv_seasons_number.dart';

// ignore: must_be_immutable
class TvDetailsEntity extends Equatable {
  final int id;
  final String name;
  String? backdropPath;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<TvGenresDetails> genres;
  final num voteAverage;
  final int numberOfSeasons;
  final String overview;
  final List<TvSeasonsNumber> seasonsNumber;

  TvDetailsEntity({
    required this.seasonsNumber,
    required this.id,
    required this.name,
    this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.voteAverage,
    required this.numberOfSeasons,
    required this.overview,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        episodeRunTime,
        firstAirDate,
        backdropPath,
        genres,
        voteAverage,
        numberOfSeasons,
        overview,
      ];
}
