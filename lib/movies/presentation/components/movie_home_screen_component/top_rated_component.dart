// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/shared_widget.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_states.dart';

import '../../controller/bloc/movie_bloc/movies_bloc.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      buildWhen: (previous, current) {
        return current is StateGetTopRatedMovies ? true : false;
      },
      builder: (context, state) {
        switch (state.requestStates) {
          case RequestStates.loading:
            return const LoadingWidgetHandling();
          case RequestStates.success:
            return SuccessWidgetHandling(state: state);
          case RequestStates.error:
            return const ErrorWidgetHandling();
        }
      },
    );
  }
}
