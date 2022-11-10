import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/shared_widget.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_bloc.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_events.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_states.dart';

class PopularTvScreen extends StatelessWidget {
  const PopularTvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => tvServiceLocator<TvBloc>()..add(OnEventPopularTv()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.popularTvs,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 22.0,
                ),
          ),
        ),
        body: BlocBuilder<TvBloc, TvStates>(
          builder: (context, state) {
            return SizedBox(
              child: ListView.builder(
                itemCount: state.tvPopularList.length,
                itemBuilder: (context, index) =>
                    TvItemBuilderForPopularAndTopRated(
                  tv: state.tvPopularList[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
