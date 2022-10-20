import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movies_states.dart';
import 'package:shimmer/shimmer.dart';

class PlayingNowComponent extends StatelessWidget {
  const PlayingNowComponent({super.key});

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
            widget = SuccesWidget(
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
      height: MediaQuery.of(context).size.height * 0.425,
      child: Center(
        child: Text(
          state.message.toString(),
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 24.0,
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
      height: MediaQuery.of(context).size.height * 0.425,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class SuccesWidget extends StatelessWidget {
  final MoviesStates state;

  const SuccesWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 800),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.44,
          viewportFraction: 1.0,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
        items: state.list.map((item) {
          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (Rect rect) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black,
                    ],
                  ).createShader(rect),
                  blendMode: BlendMode.dstOut,
                  child: CachedNetworkImage(
                    placeholder: ((context, url) => Shimmer.fromColors(
                          period: const Duration(milliseconds: 800),
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.425,
                            decoration:const BoxDecoration(
                            color: Colors.black38,
                             
                  ),
                          ),
                        )),
                    imageUrl: Constances.getUrl(item.backDropPath),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.425,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    height: MediaQuery.of(context).size.height * 0.12,
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
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Playing Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 16.0,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          item.title.toString(),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 20,
                                  ),
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
