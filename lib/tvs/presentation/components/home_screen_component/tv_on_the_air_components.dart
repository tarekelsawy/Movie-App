import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/bloc/tv_bloc/tv_bloc.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/bloc/tv_bloc/tv_states.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/component.dart';
import '../../screens/details_tv_screen.dart';

class TvOnTheAirComponent extends StatelessWidget {
  const TvOnTheAirComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvStates>(
      builder: (context, state) {
        late Widget widget;
        switch (state.requestStates) {
          case RequestStates.loading:
            widget = const LoadingWidget();
            break;
          case RequestStates.success:
            widget = SuccessWidget(
              list: state.tvOnTheAirList,
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
  final TvStates state;
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
  final List<TvEntity> list;

  const SuccessWidget({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 43.5.h,
          viewportFraction: 1.0,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
        items: list.map((item) {
          return GestureDetector(
            onTap: () {
              ///todo
              navigateTo(
                  DetailsTvScreen(
                    tvId: item.id,
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
                    imageUrl: ApiConstants.getImageUrl(item.backdropPath ??
                        '/hIZFG7MK4leU4axRFKJWqrjhmxZ.jpg'),
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
                    height: 14.h,
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
                              AppStrings.onTheAir,
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
                          item.name.toString(),
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
