part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadMovies extends MoviesEvent {
  final int days;

  const LoadMovies({required this.days});

  @override
  List<Object> get props => [days];
}
