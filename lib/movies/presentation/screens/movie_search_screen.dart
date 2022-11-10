import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/utils/component.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_search_bloc/movie_search_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_search_bloc/movie_search_event.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_search_bloc/movie_search_state.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movie_detals_screen.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/screens/home_screen.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class MovieSearchScreen extends StatelessWidget {
  MovieSearchScreen({Key? key}) : super(key: key);
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieSearchBloc>(
      create: (BuildContext buildContext) =>
          movieServiceLocator<MovieSearchBloc>(),
      child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
        builder: (context, state) {
          List<MovieEntity> movie = MovieSearchBloc.get(context).state.movies;
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: textController,
                    onChanged: (String query) {
                      if (query.isNotEmpty) {
                        Future.delayed(const Duration(milliseconds: 100)).then(
                            (valueFuture) => MovieSearchBloc.get(context)
                                .add(OnEventGetMovieSearch(query)));
                      }
                    },
                    cursorColor: Colors.white,
                    cursorWidth: 1,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search for a Movie eg.The Notebook',
                      hintStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 18.0,
                                color: const Color(0xff969494),
                              ),
                      filled: true,
                      fillColor: const Color(0xff2d2d2d),
                      contentPadding:
                          const EdgeInsets.only(left: 10.0, top: 10.0),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff969494),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (textController.text.isEmpty) {
                            navigateTo(const HomeScreen(), context);
                          } else if (textController.text.isNotEmpty) {
                            textController.text = '';
                            context
                                .read<MovieSearchBloc>()
                                .add(OnEventClearTextField());
                          }
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Color(0xff969494),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff969494),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: movie.length,
                      itemBuilder: (context, index) {
                        return ItemBuilder(
                          movie: movie[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemBuilder extends StatelessWidget {
  final MovieEntity movie;
  const ItemBuilder({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xff39394f),
      ),
      child: SizedBox(
        height: 70,
        child: ListTile(
          title: Text(
            movie.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onTap: () {
            navigateTo(MovieDetailsScreen(movieId: movie.id), context);
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: double.infinity,
              width: 50,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: ApiConstants.getImageUrl(movie.backDropPath),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          trailing: SizedBox(
            width: 50,
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  (movie.voteAverage).toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          subtitle: Text(
            setupDate(movie.releaseDate),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
          ),
          autofocus: true,
        ),
      ),
    );
  }
}
