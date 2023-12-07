import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/core/utils/colors.dart';
import 'package:movie_app_with_clean_architecture/core/utils/component.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_details_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/bloc/tv_details_bloc/tv_details_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../screens/details_tv_screen.dart';

class TvDetailsComponent extends StatelessWidget {
  const TvDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsStates>(
      buildWhen: ((previous, current) =>
          previous.detailsRequestStates != current.detailsRequestStates),
      builder: (context, state) {
        print('BlocBuilder TvDetailsComponent');
        TvDetailsEntity? model = state.detailsEntity;
        switch (state.detailsRequestStates) {
          case RequestStates.loading:
            return const DetailsLoadingState();
          case RequestStates.success:
            return DetailsSuccessState(model: model);
          case RequestStates.error:
            return DetailsErrorState(message: state.detailsMessage);
        }
      },
    );
  }
}

class DetailsErrorState extends StatelessWidget {
  final String message;
  const DetailsErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 35.h,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xff424242),
                Color(0xff424242),
                Colors.transparent,
              ],
              stops: [0.0, 0.2, 1.0, 1.0],
            ).createShader(
              Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 35.h,
            child: Center(
              child: Text(
                message.toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16.sp,
                      color: Colors.grey[200],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsLoadingState extends StatelessWidget {
  const DetailsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 35.h,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xff424242),
                Color(0xff424242),
                Colors.transparent,
              ],
              stops: [0.0, 0.2, 1.0, 1.0],
            ).createShader(
              Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              height: 35.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsSuccessState extends StatelessWidget {
  final TvDetailsEntity? model;
  const DetailsSuccessState({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 35.h,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xff424242),
                Color(0xff424242),
                Colors.transparent,
              ],
              stops: [0.0, 0.2, 1.0, 1.0],
            ).createShader(
              Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: ApiConstants.getImageUrl(
                model!.backdropPath ?? '/hIZFG7MK4leU4axRFKJWqrjhmxZ.jpg'),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                height: 35.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TvDetailsBoxComponent extends StatelessWidget {
  const TvDetailsBoxComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsStates>(
      buildWhen: (previous, current) =>
          previous.detailsRequestStates != current.detailsRequestStates,
      builder: (context, state) {
        print('BlocBuilder TvDetailsBoxComponent');
        TvDetailsEntity? model = state.detailsEntity;
        switch (state.detailsRequestStates) {
          case RequestStates.loading:
            return const DetailsBoxLoadingState();
          case RequestStates.success:
            return DetailsBoxSuccessState(model: model);
          case RequestStates.error:
            return DetailsBoxErrorState(message: state.detailsMessage);
        }
      },
    );
  }
}

class DetailsBoxSuccessState extends StatelessWidget {
  final TvDetailsEntity? model;
  const DetailsBoxSuccessState({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 20.0,
        bottom: 30,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              model!.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              width: 70.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff424242),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: Text(
                        setupDate(model!.firstAirDate),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 12.5.sp,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.8.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15.sp,
                        ),
                        Text(
                          (model!.voteAverage).toStringAsFixed(1),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 12.0.sp,
                                  ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 21.5.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${model!.numberOfSeasons}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 12.sp,
                                    color: const Color(0xffb5b5b8),
                                  ),
                        ),
                        Text(
                          'Seasons',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 12.sp,
                                    color: const Color(0xffb5b5b8),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                    child: Text(
                      setupTime(model!.episodeRunTime),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12.5.sp,
                            color: const Color(0xffb5b5b8),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ExpandableText(
              model!.overview,
              expandText: AppStrings.showMore,
              collapseText: AppStrings.showLess,
              maxLines: 2,
              linkColor: Colors.lightBlue,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12.5.sp,
                  ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              setupGenres(model!.genres),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color(0xffa5a5a9),
                    fontWeight: FontWeight.w900,
                    fontSize: 11.sp,
                    letterSpacing: 1.4,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsBoxLoadingState extends StatelessWidget {
  const DetailsBoxLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      sliver: SliverToBoxAdapter(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              height: 35.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsBoxErrorState extends StatelessWidget {
  final String message;
  const DetailsBoxErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 31.h,
          child: Center(
            child: Text(
              message.toString(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.grey[200],
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class TvDetailsTwoButtonComponent extends StatelessWidget {
  const TvDetailsTwoButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsStates>(
      buildWhen: (previous, current) =>
          previous.isEpisodes != current.isEpisodes,
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (!state.isEpisodes) {
                      context
                          .read<TvDetailsBloc>()
                          .add(OnEventChangeIsEpisodes());
                    }
                  },
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: state.isEpisodes
                              ? AppColors.redColor
                              : Colors.transparent,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.episodes,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: state.isEpisodes
                                  ? AppColors.whiteColor
                                  : AppColors.greyColor,
                              fontSize: 14.sp,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (state.isEpisodes) {
                      context
                          .read<TvDetailsBloc>()
                          .add(OnEventChangeIsEpisodes());
                    }
                  },
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: state.isEpisodes
                              ? Colors.transparent
                              : AppColors.redColor,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.moreLikeThis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: state.isEpisodes
                                  ? AppColors.greyColor
                                  : AppColors.whiteColor,
                              fontSize: 14.sp,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TvDetailsShowEpisodesAndRecommendationComponent extends StatelessWidget {
  const TvDetailsShowEpisodesAndRecommendationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsStates>(
      buildWhen: ((previous, current) =>
          previous.isEpisodes != current.isEpisodes),
      builder: (context, state) {
        print(
            'BlocBuilder TvDetailsShowEpisodesAndRecommendationComponent :${state.isEpisodes}');
        return state.isEpisodes
            ? const TvDetailsShowEpisodesComponent()
            : const TvDetailsShowRecommendationComponent();
      },
    );
  }
}

class TvDetailsShowEpisodesComponent extends StatelessWidget {
  const TvDetailsShowEpisodesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsStates>(
      buildWhen: (previous, current) =>
          (previous.detailsRequestStates != current.detailsRequestStates) ||
          (previous.episodesRequestStates != current.episodesRequestStates) ||
          (previous.isEpisodes != current.isEpisodes),
      builder: (context, state) {
        print('BlocBuilder TvDetailsShowEpisodesComponent');
        // TvDetailsEntity? detailsEntity = state.detailsEntity;
        switch (state.detailsRequestStates) {
          case RequestStates.loading:
            return const EpisodesLoadingState();
          case RequestStates.success:
            return EpisodesSuccessState(state: state);
          case RequestStates.error:
            return EpisodesErrorState(
              message: state.episodesMessage,
            );
        }
      },
    );
  }
}

class EpisodesLoadingState extends StatelessWidget {
  const EpisodesLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 5, (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: AppColors.whiteColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.symmetric(vertical: 7.0),
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class EpisodesSuccessState extends StatelessWidget {
  final TvDetailsStates state;
  const EpisodesSuccessState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    TvDetailsEntity? detailsEntity = state.detailsEntity;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: detailsEntity!.seasonsNumber.length,
            (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              context.read<TvDetailsBloc>().add(
                    OnEventGetTvEpisodes(
                      tvId: 120089,
                      seasonNumber: index + 1,
                    ),
                  );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.symmetric(vertical: 7.0),
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: const Color(0xff303030),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 24.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Season',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 13.sp,
                                  ),
                        ),
                        Text(
                          '${detailsEntity.seasonsNumber[index].seasonNumber}',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 13.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: AppColors.whiteColor,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class EpisodesErrorState extends StatelessWidget {
  final String message;
  const EpisodesErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      sliver: SliverToBoxAdapter(
          child: SizedBox(
        height: 32.5.h,
        child: Center(
          child: Text(
            message.toString(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16.sp,
                  color: Colors.grey[200],
                ),
          ),
        ),
      )),
    );
  }
}

class TvDetailsShowRecommendationComponent extends StatelessWidget {
  const TvDetailsShowRecommendationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsStates>(
      buildWhen: (prev, current) =>
          prev.recommendedRequestStates != current.recommendedRequestStates,
      builder: (context, state) {
        print('BlocBuilder TvDetailsShowRecommendationComponent');
        switch (state.recommendedRequestStates) {
          case RequestStates.loading:
            return const RecommendedLoadingState();
          case RequestStates.success:
            return RecommendedSuccessState(state: state);
          case RequestStates.error:
            return RecommendedErrorState(
              message: state.recommendedMessage,
            );
        }
      },
    );
  }
}

class RecommendedSuccessState extends StatelessWidget {
  final TvDetailsStates state;
  const RecommendedSuccessState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 31.5.w,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: GestureDetector(
                onTap: () {
                  //todo
                  navigateTo(
                      DetailsTvScreen(tvId: state.recommendedEntity[index].id),
                      context);
                },
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.getImageUrl(
                      state.recommendedEntity[index].posterPath.toString()),
                  fit: BoxFit.cover,
                  placeholder: (BuildContext context, String url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            );
          },
          childCount: state.recommendedEntity.length,
        ),
      ),
    );
  }
}

class RecommendedErrorState extends StatelessWidget {
  final String message;
  const RecommendedErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 32.5.h,
          child: Center(
            child: Text(
              message.toString(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.grey[200],
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecommendedLoadingState extends StatelessWidget {
  const RecommendedLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 31.5.w,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ));
          },
          childCount: 12,
        ),
      ),
    );
  }
}
