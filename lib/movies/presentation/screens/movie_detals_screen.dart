import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_details_screen_component/movie_details.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/movie_details_screen_component/movie_recommendations.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_details_bloc/movie_details_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => movieServiceLocator<MovieDetailsBloc>()
        ..add(OnGetMovieDetailsEvent(movieId))
        ..add(OnGetMovieRecommendationsEvent(movieId)),
      child: FadeInUp(
        duration: const Duration(milliseconds: 700),
        child: const Scaffold(
          body: CustomScrollView(
            slivers: [
              MovieDetailsComponent(),
              MovieDetailsBoxComponent(),
              MovieRecommendationsComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
