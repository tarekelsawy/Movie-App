// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/playing_now_components.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/popular_component.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/top_rated_component.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movies_events.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) => getIt<MovieBloc>()
        ..add(EventGetPlayingNowMovies())
        ..add(EventGetPopularMovies())
        ..add(EventGetTopRatedMovies()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const PlayingNowComponent(),
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
                        'Popular',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18.0,
                            ),
                      ),
                      SizedBox(
                        height: 35.0,
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'See More >',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 14.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularComponent(),
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
                        'Top Rated',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18.0,
                            ),
                      ),
                      SizedBox(
                        height: 35.0,
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'See More >',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 14.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
