// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/shared_widget.dart';

import '../controller/bloc/movies_bloc.dart';
import '../controller/bloc/movies_states.dart';

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
            return  SuccessWidgetHandling(state:state);
          case RequestStates.error:
            return const ErrorWidgetHandling();
        }
      },
    );
  }
}
