import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/tv_details_screen_component/tv_details.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/bloc/tv_details_bloc/tv_details_bloc.dart';

class DetailsTvScreen extends StatelessWidget {
  final int tvId;
  const DetailsTvScreen({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => tvServiceLocator<TvDetailsBloc>()
        ..add( OnEventGetTvDetails(tvId))
        ..add( OnEventGetTvRecommendation(tvId)),
      child: Builder(builder: (context) {
        return FadeIn(
          duration: const Duration(milliseconds: 800),
          child: const Scaffold(
            body: CustomScrollView(
              slivers: [
                TvDetailsComponent(),
                TvDetailsBoxComponent(),
                TvDetailsTwoButtonComponent(),
                TvDetailsShowEpisodesAndRecommendationComponent(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
