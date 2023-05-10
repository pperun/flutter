import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cinema/repositories/movie_session_repository.dart';

import '../../models/movie_session.dart';

part 'movie_session_event.dart';
part 'movie_session_state.dart';

class MovieSessionBloc extends Bloc<MovieSessionEvent, MovieSessionState> {
  final MovieSessionRepository repository;

  MovieSessionBloc({required this.repository})
      : super(MovieSessionsLoadingState()) {
    on<LoadMovieSessions>((event, emit) async {
      try {
        final movieSessions =
            await repository.fetchMovieSessions(event.movieId, event.date);
        movieSessions.sort((a, b) => a.date.compareTo(b.date));    
        emit(MovieSessionsLoadedState(
          movieId: event.movieId,
          date: event.date,
          movieSessions: movieSessions,
        ));
      } catch (e) {
        emit(MovieSessionsErrorState(error: e.toString()));
      }
    });
  }
}
