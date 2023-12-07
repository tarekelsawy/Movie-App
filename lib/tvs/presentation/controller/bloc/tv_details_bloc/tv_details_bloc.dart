import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_details_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_episodes_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_recommended_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_episodes_tv_use_case.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_recommended_tv_use_case.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_tv_details_usecase.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsStates> {
  final UseCaseGetDetailsTv useCaseGetDetailsTv;
  final UseCaseGetRecommendedTv useCaseGetRecommendedTv;
  final UseCaseGetEpisodesTv useCaseGetEpisodesTv;
  static int? flagOfClickedSeasons = -1;
  TvDetailsBloc(this.useCaseGetEpisodesTv, this.useCaseGetRecommendedTv,
      this.useCaseGetDetailsTv)
      : super(const TvDetailsStates()) {
    on<OnEventGetTvDetails>(_getTvDetails);
    on<OnEventChangeIsEpisodes>(_changeIsEpisodes);
    on<OnEventGetTvEpisodes>(_getTvEpisodes);
    on<OnEventGetTvRecommendation>(_getTvRecommendation);
  }
  static TvDetailsBloc get(context) => BlocProvider.of(context);

  Future<FutureOr<void>> _getTvDetails(
      OnEventGetTvDetails event, Emitter<TvDetailsStates> emit) async {
    final result = await useCaseGetDetailsTv(MovieDetailsParameter(event.tvId));

    result.fold((l) {
      emit(
        TvDetailsStates(
          detailsRequestStates: RequestStates.error,
          detailsMessage: l.message,
        ),
      );
    }, (r) {
      print('tv success data');
      emit(
        TvDetailsStates(
          detailsRequestStates: RequestStates.success,
          detailsEntity: r,
        ),
      );
    });
  }

  FutureOr<void> _changeIsEpisodes(
      OnEventChangeIsEpisodes event, Emitter<TvDetailsStates> emit) {
    emit(state.copyWith(
      isEpisodes: !state.isEpisodes,
    ));
  }

  Future<FutureOr<void>> _getTvEpisodes(
      OnEventGetTvEpisodes event, Emitter<TvDetailsStates> emit) async {
    final result = await useCaseGetEpisodesTv(EpisodesTvParameter(
      tvId: event.tvId,
      seasonNumber: event.seasonNumber,
    ));
    result.fold(
      (l) => emit(
        state.copyWith(
          episodesMessage: l.message,
          episodesRequestStates: RequestStates.error,
        ),
      ),
      (r) => emit(state.copyWith(
        episodesRequestStates: RequestStates.success,
        tvEpisodesEntity: r,
      )),
    );
  }

  Future<FutureOr<void>> _getTvRecommendation(
      OnEventGetTvRecommendation event, Emitter<TvDetailsStates> emit) async {
    final result =
        await useCaseGetRecommendedTv(RecommendedTvParameter(event.tvId));
    result.fold(
      (l) => emit(
        state.copyWith(
            recommendedMessage: l.message,
            recommendedRequestStates: RequestStates.error),
      ),
      (r) => emit(
        state.copyWith(
          recommendedRequestStates: RequestStates.success,
          tvRecommendedEntity: r,
        ),
      ),
    );
  }
}
