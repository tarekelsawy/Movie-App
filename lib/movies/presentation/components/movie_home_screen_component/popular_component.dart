import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/component.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/shared_widget.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_states.dart';
import 'package:sizer/sizer.dart';

import '../../controller/bloc/movie_bloc/movies_bloc.dart';

class MoviePopularComponent extends StatelessWidget {
  const MoviePopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      buildWhen: ((previous, current) {
        return current is StateGetPopularMovies ? true : false;
      }),
      builder: (context, state) {
        debugPrint('now playing list : ${state.list}');
        switch (state.requestStates) {
          case RequestStates.loading:
            return const LoadingWidgetHandling();
          case RequestStates.success:
            return MovieSuccessWidgetHandling(state: state);
          case RequestStates.error:
            return const ErrorWidgetHandling();
        }
      },
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
      child: SizedBox(
        height: 20.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: state.list.length,
          itemBuilder: (context, index) {
            return MovieItemListView(item: state.list[index]);
          },
        ),
      ),
    );
  }
}
