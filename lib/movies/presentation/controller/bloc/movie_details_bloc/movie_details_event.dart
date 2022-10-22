part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  final int movieId;
  const MovieDetailsEvent(
    this.movieId,
  );

  @override
  List<Object> get props => [movieId];
}

class OnGetMovieDetailsEvent extends MovieDetailsEvent {
  const OnGetMovieDetailsEvent(super.movieId);
}

class OnGetMovieRecommendationsEvent extends MovieDetailsEvent {
  const OnGetMovieRecommendationsEvent(super.movieId);
}
