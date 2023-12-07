part of 'tv_details_bloc.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();
}

class OnEventChangeIsEpisodes extends TvDetailsEvent {
  @override
  List<Object> get props => [];
}

class OnEventGetTvDetails extends TvDetailsEvent {
  final int tvId;

  const OnEventGetTvDetails(this.tvId);

  @override
  List<Object> get props => [tvId];
}

class OnEventGetTvEpisodes extends TvDetailsEvent {
  final int tvId;
  final int seasonNumber;
  const OnEventGetTvEpisodes({required this.tvId, required this.seasonNumber});

  @override
  List<Object> get props => [tvId, seasonNumber];
}

class OnEventGetTvRecommendation extends TvDetailsEvent {
  final int tvId;

  const OnEventGetTvRecommendation(this.tvId);

  @override
  List<Object> get props => [tvId];
}
