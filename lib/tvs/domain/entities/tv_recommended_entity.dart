import 'package:equatable/equatable.dart';

class TvRecommendedEntity extends Equatable {
  final int id;
  final String? posterPath;

  const TvRecommendedEntity({required this.id, this.posterPath});

  @override
  List<Object?> get props => [id, posterPath];
}
