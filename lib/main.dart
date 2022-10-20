import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/core/utils/bloc_observer.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/screens/movies_home_screen.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  ServiceLocator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 39, 39, 39),
        primarySwatch: Colors.blue,
        fontFamily: 'Righteous Regular',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const MovieHomeScreen(),
    );
  }
}
