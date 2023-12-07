import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/core/utils/component.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_states.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movie_detals_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MoviePlayingNowComponent extends StatelessWidget {
  const MoviePlayingNowComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      buildWhen: ((previous, current) {
        return current is StateGetPlayingNowMovies ? true : false;
      }),
      builder: (context, state) {
        late Widget widget;
        switch (state.requestStates) {
          case RequestStates.loading:
            widget = const LoadingWidget();
            break;
          case RequestStates.success:
            widget = SuccessWidget(
              state: state,
            );
            break;
          case RequestStates.error:
            widget = ErrorWidget(
              state: state,
            );
            break;
        }
        return widget;
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final MoviesStates state;
  const ErrorWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5.h,
      child: Center(
        child: Text(
          state.message.toString(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 16.sp,
                color: Colors.grey[200],
              ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5.h,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  final MoviesStates state;

  const SuccessWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 800),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 43.5.h,
          viewportFraction: 1.0,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
        items: state.list.map((item) {
          return GestureDetector(
            onTap: () {
              navigateTo(
                  MovieDetailsScreen(
                    movieId: item.id,
                  ),
                  context);
            },
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (Rect rect) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black,
                    ],
                  ).createShader(rect),
                  blendMode: BlendMode.dstOut,
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: ((context, url) => Shimmer.fromColors(
                          period: const Duration(milliseconds: 800),
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 42.5.h,
                            decoration: const BoxDecoration(
                              color: Colors.black38,
                            ),
                          ),
                        )),
                    imageUrl: ApiConstants.getImageUrl(item.backDropPath),
                    fit: BoxFit.cover,
                    height: 41.h,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    height: 16.h,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 5.0,
                            ),
                            SizedBox(
                              width: 2.5.w,
                            ),
                            Text(
                              AppStrings.playingNow,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.6.h,
                        ),
                        Text(
                          item.title.toString(),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 17.sp,
                                  ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
