import '../data_sources/network_data_source.dart';
import '../models/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> fetchMovies(DateTime date);
  Future<Map<DateTime, List<Movie>>> fetchMoviesForDays(
      int days);
}

class MoviesRepositoryImpl implements MoviesRepository {
  final dataSource = NetworkDataSourceImpl();

  MoviesRepositoryImpl();

  @override
  Future<List<Movie>> fetchMovies(DateTime date) async {
    try {
      return await dataSource.fetchMovies(date);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<Map<DateTime, List<Movie>>> fetchMoviesForDays(int days) async {
    try {
      Map<DateTime, List<Movie>> moviesMap = {};

      DateTime now = DateTime.now();

      for(int i = 0; i < days; i++) {
        DateTime date = now.add(Duration(days: i));
        moviesMap[date] = await dataSource.fetchMovies(date);
      }
      return moviesMap;
    } catch (e) {
      return Future.error(e);
    }
  }
}
