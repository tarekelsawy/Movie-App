part of 'tv_details_bloc.dart';

class TvDetailsStates extends Equatable {
  ///tv details
  final RequestStates detailsRequestStates;
  final TvDetailsEntity? detailsEntity;
  final String detailsMessage;
  final bool isEpisodes;

  ///episodes
  final RequestStates episodesRequestStates;
  final List<TvEpisodesEntity> episodesEntity;
  final String episodesMessage;

  ///recommendation
  final RequestStates recommendedRequestStates;
  final List<TvRecommendedEntity> recommendedEntity;
  final String recommendedMessage;

  const TvDetailsStates({
    this.detailsRequestStates = RequestStates.loading,
    this.detailsEntity,
    this.detailsMessage = '',
    this.isEpisodes = true,

    ///episodes
    this.episodesRequestStates = RequestStates.loading,
    this.episodesEntity = const [],
    this.episodesMessage = '',

    ///recommendation
    this.recommendedRequestStates = RequestStates.loading,
    this.recommendedEntity = const [],
    this.recommendedMessage = '',
  });

  TvDetailsStates copyWith({
    String? detailsMessage,
    TvDetailsEntity? tvDetailsEntity,
    RequestStates? detailsRequestStates,
    String? episodesMessage,
    List<TvEpisodesEntity>? tvEpisodesEntity,
    RequestStates? episodesRequestStates,
    String? recommendedMessage,
    List<TvRecommendedEntity>? tvRecommendedEntity,
    RequestStates? recommendedRequestStates,
    bool? isEpisodes,
  }) =>
      TvDetailsStates(
        detailsMessage: detailsMessage ?? this.detailsMessage,
        detailsRequestStates: detailsRequestStates ?? this.detailsRequestStates,
        detailsEntity: tvDetailsEntity ?? detailsEntity,

        ///episodes
        episodesMessage: episodesMessage ?? this.episodesMessage,
        episodesRequestStates:
            episodesRequestStates ?? this.episodesRequestStates,
        episodesEntity: tvEpisodesEntity ?? episodesEntity,

        ///recommendation
        recommendedMessage: recommendedMessage ?? this.recommendedMessage,
        recommendedRequestStates:
            recommendedRequestStates ?? this.recommendedRequestStates,
        recommendedEntity: tvRecommendedEntity ?? recommendedEntity,

        ///toggle button
        isEpisodes: isEpisodes ?? this.isEpisodes,
      );

  @override
  List<Object?> get props => [
        detailsRequestStates,
        detailsEntity,
        detailsMessage,
        isEpisodes,
        episodesRequestStates,
        episodesEntity,
        episodesMessage,
        recommendedRequestStates,
        recommendedEntity,
        recommendedMessage,
      ];
}
