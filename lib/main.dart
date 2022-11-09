import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/services/service_locator.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/core/utils/bloc_observer.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/screens/home_screen.dart';

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
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColorDark: const Color(0xff1e1e29),
        scaffoldBackgroundColor: const Color(0xff1e1e29),
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: AppStrings.bodyTextOneFontFamily,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontFamily: AppStrings.bodyTextTwoFontFamily,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
