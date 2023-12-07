// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class EventGetPlayingNowMovies extends MoviesEvents {}

class EventGetPopularMovies extends MoviesEvents {}

class EventGetTopRatedMovies extends MoviesEvents {}

class EventGetChangedIndexMovies extends MoviesEvents {
  final int index;
  EventGetChangedIndexMovies({
    required this.index,
  });
}
