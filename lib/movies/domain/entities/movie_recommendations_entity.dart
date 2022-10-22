import 'package:equatable/equatable.dart';

class MovieRecommendationsEntity extends Equatable {
  final int id;
  final String backdropPath;

  const MovieRecommendationsEntity({
    required this.id,
    required this.backdropPath,
  });

  @override
  List<Object> get props => [id, backdropPath];
}
