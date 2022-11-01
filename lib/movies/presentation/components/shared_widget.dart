import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/genres.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_states.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movie_detals_screen.dart';
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
        child: GestureDetector(
          onTap: () {
            navigateTo(MovieDetailsScreen(movieId: item.id), context);
          },
          child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: Constants.getImageUrl(item.backDropPath),
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
      ),
    );
  }
}

void navigateTo(Widget screen, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

class ItemBuilderForPopularAndTopRated extends StatelessWidget {
  final MovieEntity movie;
  const ItemBuilderForPopularAndTopRated({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(MovieDetailsScreen(movieId: movie.id), context);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height * 0.21,
        decoration: BoxDecoration(
          color: const Color(0xff303030),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.31,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: Constants.getImageUrl(movie.backDropPath),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 22.0,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffff5252),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                            child: Text(
                              setupDate(movie.releaseDate),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16.0,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        SizedBox(
                          width: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.0,
                              ),
                              Text(
                                (movie.voteAverage).toStringAsFixed(1),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 16.0,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14.0,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String setupDate(String date) {
  return date.split('-')[0];
}

String setupTime(int time) {
  return time >= 60
      ? '${(time ~/ 60)}h ${time % 60 == 0 ? '' : '${time % 60}m'}'
      : '${time % 60}m';
}

String setupGenres(List<Genres> genres) {
  String s = 'Genres: ';
  int ln = genres.length;
  for (int i = 0; i < ln; ++i) {
    s += genres[i].name + (i == ln - 1 ? '' : ', ');
  }
  return s;
}
