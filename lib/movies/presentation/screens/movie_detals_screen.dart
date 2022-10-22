import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_details_bloc/movie_details_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsBloc>()
        ..add(
          const OnGetMovieDetailsEvent(616820),
        ),
        lazy: false,
        child:Container(),
    );
  }
}
