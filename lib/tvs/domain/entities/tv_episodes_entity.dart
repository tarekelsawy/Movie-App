import 'package:equatable/equatable.dart';

class TvEpisodesEntity extends Equatable {
  final int id;
  final String name;
  final String airDate;
  final int episodeNumber;
  final String overview;
  final String stillPath;

  const TvEpisodesEntity({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episodeNumber,
    required this.overview,
    required this.stillPath,
  });

  @override
  List<Object> get props => [
        id,
        name,
        airDate,
        episodeNumber,
        overview,
        stillPath,
      ];
}
