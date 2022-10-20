import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bloc/movies_bloc.dart';
import '../controller/bloc/movies_states.dart';
import '../screens/movies_home_screen.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      buildWhen: (previous, current) {
        return current is StateGetTopRatedMovies ? true : false;
      },
      builder: (context, state) {
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
      },
    );
  }
}
