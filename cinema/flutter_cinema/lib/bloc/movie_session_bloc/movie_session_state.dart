part of 'movie_session_bloc.dart';

abstract class MovieSessionState extends Equatable {
  const MovieSessionState();

  @override
  List<Object> get props => [];
}

class MovieSessionsLoadingState extends MovieSessionState {}

class MovieSessionsLoadedState extends MovieSessionState {
  final int movieId;
  final DateTime date;
  final List<MovieSession> movieSessions;

  const MovieSessionsLoadedState(
      {required this.movieId,
      required this.date,
      this.movieSessions = const <MovieSession>[]});

  @override
  List<Object> get props => [movieId, date, movieSessions];
}

class MovieSessionsErrorState extends MovieSessionState {
  final String error;

  const MovieSessionsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
