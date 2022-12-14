import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_recommendations_entity.dart';

class MovieRecommendationsModel extends MovieRecommendationsEntity {
  const MovieRecommendationsModel(
      {required super.id, required super.backdropPath});

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) {
    return MovieRecommendationsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? '/zmpvhQQ8HcwwD1MujPZIEpT92GW.jpg',
    );
  }
}
