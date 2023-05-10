part of 'movie_session_bloc.dart';

abstract class MovieSessionEvent extends Equatable {
  const MovieSessionEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieSessions extends MovieSessionEvent {
  final int movieId;
  final DateTime date;

  const LoadMovieSessions({required this.movieId, required this.date});
}
