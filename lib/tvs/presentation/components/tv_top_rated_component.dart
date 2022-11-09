// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/component.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/components/shared_widget.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_bloc.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/tv_states.dart';

class TvTopRatedComponent extends StatelessWidget {
  const TvTopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvStates>(
      builder: (context, state) {
        switch (state.requestStates) {
          case RequestStates.loading:
            return const LoadingWidgetHandling();
          case RequestStates.success:
            return TvSuccessWidgetHandling(list: state.tvTopRatedList);
          case RequestStates.error:
            return const ErrorWidgetHandling();
        }
      },
    );
  }
}
