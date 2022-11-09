import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_events.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_bloc.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_events.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieServiceLocator<MovieBloc>()
            ..add(EventGetPlayingNowMovies())
            ..add(EventGetPopularMovies())
            ..add(EventGetTopRatedMovies()),
        ),
        BlocProvider(
          create: (context) => tvServiceLocator<TvBloc>()
            ..add(OnEventOnTheAirTv())
            ..add(OnEventTopRatedTv())
            ..add(OnEventPopularTv()),
        ),
      ],
      child: BlocBuilder<TvBloc, TvStates>(
        builder: (context, state) {
          TvBloc tv = TvBloc.get(context);
          return Scaffold(
            body: state.screen[state.indexOfHomeScreen],
            bottomNavigationBar: ConvexAppBar(
              style: TabStyle.fixedCircle,
              backgroundColor: Theme.of(context).primaryColorDark,
              items: const [
                TabItem(icon: Icons.tv),
                TabItem(icon: Icons.search),
                TabItem(icon: Icons.movie),
              ],
              initialActiveIndex: state.indexOfHomeScreen,
              onTap: (int index) {
                print('onTap index:$index');
                tv.add(OnEventGetHomeScreen(index));
              },
            ),
          );
        },
      ),
    );
  }
}
