import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_seasons_number.dart';

class TvSeasonNumberModel extends TvSeasonsNumber {
  const TvSeasonNumberModel({required super.seasonNumber});

  factory TvSeasonNumberModel.fromJson(Map<String, dynamic> json) =>
      TvSeasonNumberModel(
        seasonNumber: json['season_number'],
      );
}
