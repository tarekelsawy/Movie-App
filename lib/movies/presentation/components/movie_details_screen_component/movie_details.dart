import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/core/utils/component.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_details_bloc/movie_details_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      buildWhen: (prev, current) => current is StateGetMovieDetails,
      builder: (context, state) {
        MovieDetailsEntity model = state.movieDetails;
        switch (state.requestStates) {
          case RequestStates.loading:
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
          case RequestStates.success:
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: ApiConstants.getImageUrl(model.backdropPath),
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
          case RequestStates.error:
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
                        state.message.toString(),
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
      },
    );
  }
}

class MovieDetailsBoxComponent extends StatelessWidget {
  const MovieDetailsBoxComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      buildWhen: (prev, current) => current is StateGetMovieDetails,
      builder: (context, state) {
        MovieDetailsEntity model = state.movieDetails;
        switch (state.requestStates) {
          case RequestStates.loading:
            return SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
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
          case RequestStates.success:
            return SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20.sp,
                          ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: 60.w,
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
                                setupDate(model.releaseDate),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 12.5.sp,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15.sp,
                                ),
                                Text(
                                  (model.voteAverage).toStringAsFixed(1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 12.0.sp,
                                      ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                            child: Text(
                              setupTime(model.runtime),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
                      model.overview,
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
                      setupGenres(model.genres),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xffa5a5a9),
                            fontWeight: FontWeight.w900,
                            fontSize: 11.sp,
                            letterSpacing: 1.4,
                          ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      AppStrings.moreLikeThis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12.5.sp,
                          ),
                    ),
                  ],
                ),
              ),
            );
          case RequestStates.error:
            return SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 31.h,
                  child: Center(
                    child: Text(
                      state.message.toString(),
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
      },
    );
  }
}
