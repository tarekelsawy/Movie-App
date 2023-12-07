import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_recommended_entity.dart';

class TvRecommendedModel extends TvRecommendedEntity {
  const TvRecommendedModel({required super.id, super.posterPath});

  factory TvRecommendedModel.fromJson(Map<String, dynamic> json) {
    
    return TvRecommendedModel(
        id: json['id'],
        posterPath: json['poster_path'] ?? '/3EwkiSokUJRkAwB3b3bFG3J8IoA.jpg');
  }
}
