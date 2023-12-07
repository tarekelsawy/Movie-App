import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_episodes_entity.dart';

class TvEpisodesModel extends TvEpisodesEntity {
  const TvEpisodesModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.airDate,
    required super.episodeNumber,
    required super.stillPath,
  });

  factory TvEpisodesModel.fromJson(Map<String, dynamic> json) {
   
    return TvEpisodesModel(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      airDate: json['air_date'],
      episodeNumber: json['episode_number'],
      stillPath: json['still_path']??'/q3tcwPTNPfBMWGNqU5pL6EhyhrW.jpg',
    );
  }
}
