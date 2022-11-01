import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/shared_widget.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_events.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_states.dart';

class TopRatedMovieScreen extends StatelessWidget {
  const TopRatedMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieBloc>()..add(EventGetTopRatedMovies()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            AppStrings.topRatedMovies,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 22.0,
                ),
          ),
        ),
        body: BlocBuilder<MovieBloc, MoviesStates>(
          builder: (context, state) {
            return SizedBox(
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) =>
                    ItemBuilderForPopularAndTopRated(
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
