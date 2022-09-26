import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backDropPath;
  final String overview;
  final double voteAverage;
  final List genreIds;
  final String releaseDate;
   const MovieEntity({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backDropPath,
        overview,
        voteAverage,
        genreIds,
        releaseDate,
      ];
}
