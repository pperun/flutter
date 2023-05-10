part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesLoadingState extends MoviesState {}

class MoviesLoadedState extends MoviesState {
  final Map<DateTime, List<Movie>> movies;

  const MoviesLoadedState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class MoviesErrorState extends MoviesState {
  final String error;

  const MoviesErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
