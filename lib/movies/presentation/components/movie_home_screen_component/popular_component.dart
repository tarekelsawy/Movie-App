import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/components/shared_widget.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_states.dart';

import '../../controller/bloc/movie_bloc/movies_bloc.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      buildWhen: ((previous, current) {
        return current is StateGetPopularMovies ? true : false;
      }),
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

class SuccessWidget extends StatelessWidget {
  final MoviesStates state;
  const SuccessWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 800),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: state.list.length,
          itemBuilder: (context, index) {
            return ItemListView(item: state.list[index]);
          },
        ),
      ),
    );
  }
}
