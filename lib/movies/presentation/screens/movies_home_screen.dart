// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/playing_now_components.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/popular_component.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_home_screen_component/top_rated_component.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/popular_movie_screen.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/top_rated_movie_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_route/transparent_route.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 15.sp,
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
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 11.sp,
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
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 15.sp,
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
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 11.sp,
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
  }
}
