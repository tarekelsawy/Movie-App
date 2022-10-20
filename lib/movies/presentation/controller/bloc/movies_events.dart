import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable{
  @override
  List<Object?> get props => [];

}

class EventGetPlayingNowMovies extends MoviesEvents{}

class EventGetPopularMovies extends MoviesEvents{}

class EventGetTopRatedMovies extends MoviesEvents{}