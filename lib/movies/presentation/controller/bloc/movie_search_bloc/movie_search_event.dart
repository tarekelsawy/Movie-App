import 'package:equatable/equatable.dart';

abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();
}

class OnEventGetMovieSearch extends MovieSearchEvent {
  final String searchQuery;

  const OnEventGetMovieSearch(this.searchQuery);

  @override
  List<Object> get props => [searchQuery];
}

class OnEventClearTextField extends MovieSearchEvent {
  @override
  List<Object> get props => [];
}
