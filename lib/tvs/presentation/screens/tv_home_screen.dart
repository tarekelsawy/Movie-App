import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/tv_on_the_air_components.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/tv_popular_component.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/tv_top_rated_component.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/screens/popular_tv_screen.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/screens/top_rated_tv_screen.dart';
import 'package:transparent_route/transparent_route.dart';

class TvHomeScreen extends StatelessWidget {
  const TvHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        pushScreen(
                          context,
                          const PopularTvScreen(),
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
                        pushScreen(
                          context,
                          const TopRatedTvScreen(),
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
            const TvTopRatedComponent(),
          ],
        ),
      ),
    );
  }
}
