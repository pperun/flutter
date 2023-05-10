import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/pages/movies_page.dart';
import 'package:flutter_cinema/repositories/movies_repository.dart';

import 'bloc/movies_bloc/movies_bloc.dart';

void main() {
  runApp(const FlutterCinema());
}

class FlutterCinema extends StatelessWidget {
  const FlutterCinema({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Satisfy',
            ),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16),
            bodyLarge: TextStyle(fontSize: 24),
          ),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: Colors.white,
            contentTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Monsterrat'),
      home: BlocProvider(
        create: (context) => MoviesBloc(
          repository: MoviesRepositoryImpl(),
        )..add(
            const LoadMovies(days: 7),
          ),
        child: const MoviesPage(),
      ),
    );
  }
}
