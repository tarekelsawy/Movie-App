import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/core/utils/no_parameter_class.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_on_the_air_tv_usecase.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_popular_tv_usecase.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_tv_top_rated_tv.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_events.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_states.dart';

class TvBloc extends Bloc<TvEvents, TvStates> {
  final UseCaseGetOnTheAirTv useCaseGetOnTheAirTv;
  final UseCaseGetPopularTv useCaseGetPopularTv;
  final UseCaseGetTopRatedTv useCaseGetTopRatedTv;
  TvBloc(
    this.useCaseGetOnTheAirTv,
    this.useCaseGetPopularTv,
    this.useCaseGetTopRatedTv,
  ) : super(const TvStates()) {
    on<OnEventOnTheAirTv>(_getOnTheAirTv);
    on<OnEventPopularTv>(_getPopularTv);
    on<OnEventTopRatedTv>(_getTopRatedTv);
    on<OnEventGetHomeScreen>(_getHomeScreen);
  }

  static TvBloc get(context) => BlocProvider.of(context);

  Future<FutureOr<void>> _getOnTheAirTv(
      OnEventOnTheAirTv event, Emitter<TvStates> emit) async {
    final result = await useCaseGetOnTheAirTv(const NoParameter());

    result.fold(
        (l) => emit(
              state.copyWith(
                  requestStates: RequestStates.error, message: l.message),
            ), (r) {
      emit(
        state.copyWith(
          tvOnTheAirList: r,
          requestStates: RequestStates.success,
        ),
      );
    });
  }

  Future<FutureOr<void>> _getPopularTv(
      OnEventPopularTv event, Emitter<TvStates> emit) async {
    final result = await useCaseGetPopularTv(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          requestStates: RequestStates.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          tvPopularList: r,
          requestStates: RequestStates.success,
        ),
      ),
    );
  }

  Future<FutureOr<void>> _getTopRatedTv(
      OnEventTopRatedTv event, Emitter<TvStates> emit) async {
    final result = await useCaseGetTopRatedTv(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          requestStates: RequestStates.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          tvTopRatedList: r,
          requestStates: RequestStates.success,
        ),
      ),
    );
  }

  FutureOr<void> _getHomeScreen(
      OnEventGetHomeScreen event, Emitter<TvStates> emit) {
    print('bef emit ${event.indexOfHomeScreen}');
    emit(
      state.copyWith(
        indexOfHomeScreen: event.indexOfHomeScreen,
      ),
    );
  }
}
