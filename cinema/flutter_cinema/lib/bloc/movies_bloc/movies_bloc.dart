import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cinema/repositories/movies_repository.dart';

import '../../models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository repository;

  MoviesBloc({required this.repository})
      : super(MoviesLoadingState()) {
    on<LoadMovies>((event, emit) async {
      try {
        final movies = await repository.fetchMoviesForDays(event.days);
        emit(MoviesLoadedState(movies: movies));
      } catch (e) {
        emit(MoviesErrorState(error: e.toString()));
      }
    });
  }
}
