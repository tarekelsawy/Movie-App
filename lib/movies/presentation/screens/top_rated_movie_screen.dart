import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/shared_widget.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_events.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_states.dart';
import 'package:sizer/sizer.dart';

class TopRatedMovieScreen extends StatelessWidget {
  const TopRatedMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          movieServiceLocator<MovieBloc>()..add(EventGetTopRatedMovies()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            AppStrings.topRatedMovies,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18.sp,
                ),
          ),
        ),
        body: BlocBuilder<MovieBloc, MoviesStates>(
          builder: (context, state) {
            return SizedBox(
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) =>
                    MovieItemBuilderForPopularAndTopRated(
                  movie: state.list[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
