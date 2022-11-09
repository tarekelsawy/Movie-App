import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/genres.dart';

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

void navigateTo(Widget screen, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
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
