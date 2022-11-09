import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movie_search_screen.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movies_home_screen.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/screens/tv_home_screen.dart';

class TvStates extends Equatable {
  final RequestStates requestStates;
  final List<TvEntity> tvOnTheAirList;
  final List<TvEntity> tvPopularList;
  final List<TvEntity> tvTopRatedList;
  final List<Widget> screen;
  final int indexOfHomeScreen;
  final String message;

  const TvStates({
    this.indexOfHomeScreen = 0,
    this.screen = const [
      TvHomeScreen(),
      MovieSearchScreen(),
      MovieHomeScreen(),
    ],
    this.requestStates = RequestStates.loading,
    this.tvOnTheAirList = const [],
    this.tvPopularList = const [],
    this.tvTopRatedList = const [],
    this.message = '',
  });

  TvStates copyWith({
    RequestStates? requestStates,
    List<TvEntity>? tvOnTheAirList,
    List<TvEntity>? tvPopularList,
    List<TvEntity>? tvTopRatedList,
    String? message,
    int? indexOfHomeScreen,
    List<Widget>? screen,
  }) =>
      TvStates(
        requestStates: requestStates ?? this.requestStates,
        tvOnTheAirList: tvOnTheAirList ?? this.tvOnTheAirList,
        tvPopularList: tvPopularList ?? this.tvPopularList,
        tvTopRatedList: tvTopRatedList ?? this.tvTopRatedList,
        screen: screen ?? this.screen,
        indexOfHomeScreen: indexOfHomeScreen ?? this.indexOfHomeScreen,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        requestStates,
        tvOnTheAirList,
        tvPopularList,
        tvTopRatedList,
        screen,
        indexOfHomeScreen,
        message,
      ];
}
//
// class InitialState extends TvStates {}
//
// class StateGetHomeScreen extends TvStates {
//   StateGetHomeScreen({super.indexOfHomeScreen,super.tvList,super.requestStates}) {
//     print('hello get home state');
//   }
// }
//
// class StateGetOnTheAirTv extends TvStates {
//   const StateGetOnTheAirTv({super.message, super.requestStates, super.tvList});
// }
//
// class StateGetPopularTv extends TvStates {
//   const StateGetPopularTv({super.message, super.requestStates, super.tvList});
// }
//
// class StateGetTopRatedTv extends TvStates {
//   const StateGetTopRatedTv({super.message, super.requestStates, super.tvList});
// }
