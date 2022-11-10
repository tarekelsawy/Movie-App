import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movie_search_screen.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movies_home_screen.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/screens/tv_home_screen.dart';

class Constants {
  static List<Widget> screens = [
    const TvHomeScreen(),
    MovieSearchScreen(),
    const MovieHomeScreen(),
  ];
}
