import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/component.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/shared_widget.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_bloc.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_states.dart';

class TvPopularComponent extends StatelessWidget {
  const TvPopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvStates>(
      builder: (context, state) {
        switch (state.requestStates) {
          case RequestStates.loading:
            return const LoadingWidgetHandling();
          case RequestStates.success:
            return TvSuccessWidgetHandling(list: state.tvPopularList);
          case RequestStates.error:
            return const ErrorWidgetHandling();
        }
      },
    );
  }
}
