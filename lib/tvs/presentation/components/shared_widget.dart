import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/core/utils/component.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/playing_now_components.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/popular_component.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/top_rated_component.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/popular_movie_screen.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/top_rated_movie_screen.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/tv_on_the_air_components.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/tv_popular_component.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/tv_top_rated_component.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_route/transparent_route.dart';

class TvSuccessWidgetHandling extends StatelessWidget {
  final List<TvEntity> list;
  const TvSuccessWidgetHandling({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 800),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return TvItemListView(item: list[index]);
          },
        ),
      ),
    );
  }
}

class TvItemListView extends StatelessWidget {
  final TvEntity item;
  const TvItemListView({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      width: MediaQuery.of(context).size.width * 0.31,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: GestureDetector(
          onTap: () {
            ///TODO:navigateTo(MovieDetailsScreen(movieId: item.id), context);
          },
          child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: Constants.getImageUrl(
                  item.posterPath ?? '/hIZFG7MK4leU4axRFKJWqrjhmxZ.jpg'),
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  period: const Duration(milliseconds: 500),
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  enabled: true,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.31,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class TvItemBuilderForPopularAndTopRated extends StatelessWidget {
  final TvEntity tv;
  const TvItemBuilderForPopularAndTopRated({Key? key, required this.tv})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: navigateTo(MovieDetailsScreen(tvId: tv.id), context);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height * 0.21,
        decoration: BoxDecoration(
          color: const Color(0xff303030),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.31,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: Constants.getImageUrl(
                    tv.posterPath ?? '/hIZFG7MK4leU4axRFKJWqrjhmxZ.jpg'),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tv.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 22.0,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffff5252),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                            child: Text(
                              setupDate(tv.firstAirDate),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16.0,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        SizedBox(
                          width: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.0,
                              ),
                              Text(
                                (tv.voteAverage).toStringAsFixed(1),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 16.0,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    tv.overview,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14.0,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen {
  static Widget getMovieHomeScreen(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MoviePlayingNowComponent(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.popular,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    SizedBox(
                      height: 35.0,
                      child: InkWell(
                        onTap: () {
                          pushScreen(
                            context,
                            const PopularMovieScreen(),
                            isTransparent: true,
                          );
                        },
                        child: Center(
                          child: Text(
                            AppStrings.seeMore,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const MoviePopularComponent(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.topRated,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    SizedBox(
                      height: 35.0,
                      child: InkWell(
                        onTap: () {
                          pushScreen(
                            context,
                            const TopRatedMovieScreen(),
                            isTransparent: true,
                          );
                        },
                        child: Center(
                          child: Text(
                            AppStrings.seeMore,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const MovieTopRatedComponent(),
            ],
          ),
        ),
      );
  static Widget getTvHomeScreen(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TvOnTheAirComponent(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.popular,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    SizedBox(
                      height: 35.0,
                      child: InkWell(
                        onTap: () {
                          ///TODO
                          // pushScreen(
                          //   context,
                          //   const PopularMovieScreen(),
                          //   isTransparent: true,
                          // );
                        },
                        child: Center(
                          child: Text(
                            AppStrings.seeMore,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TvPopularComponent(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.topRated,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    SizedBox(
                      height: 35.0,
                      child: InkWell(
                        onTap: () {
                          ///TODO
                          // pushScreen(
                          //   context,
                          //   const TopRatedMovieScreen(),
                          //   isTransparent: true,
                          // );
                        },
                        child: Center(
                          child: Text(
                            AppStrings.seeMore,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TvTopRatedComponent(),
            ],
          ),
        ),
      );
}
