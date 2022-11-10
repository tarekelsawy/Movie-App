import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_details_genres.dart';

class TvDetailsGenresModel extends TvGenresDetails {
  const TvDetailsGenresModel({
    required super.name,
  });

  factory TvDetailsGenresModel.fromJson(Map<String, dynamic> json) =>
      TvDetailsGenresModel(
        name: json['name'],
      );
}
