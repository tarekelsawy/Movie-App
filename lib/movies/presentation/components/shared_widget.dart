
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movies_states.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movies_home_screen.dart';
import 'package:shimmer/shimmer.dart';

class ErrorWidgetHandling extends StatelessWidget {
  const ErrorWidgetHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}


class LoadingWidgetHandling extends StatelessWidget {
  const LoadingWidgetHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


class SuccessWidgetHandling extends StatelessWidget {
  final MoviesStates state;
  const SuccessWidgetHandling({
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


class ItemListView extends StatelessWidget {
  final MovieEntity item;
  const ItemListView({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      width: MediaQuery.of(context).size.width * 0.31,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
            imageUrl: Constances.getUrl(item.backDropPath),
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return Shimmer.fromColors(
                period: const Duration(milliseconds: 500),
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                enabled: true,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.31,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

