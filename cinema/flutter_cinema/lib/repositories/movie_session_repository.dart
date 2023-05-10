import 'package:flutter_cinema/data_sources/network_data_source.dart';

import '../models/movie_session.dart';

abstract class MovieSessionRepository {
  Future<List<MovieSession>> fetchMovieSessions(int movieId, DateTime date);
}

class MovieSessionRepositoryImpl extends MovieSessionRepository {
  final dataSource = NetworkDataSourceImpl();
  
  @override
  Future<List<MovieSession>> fetchMovieSessions(int movieId, DateTime date) async {
    try {
      return await dataSource.fetchMovieSessions(movieId, date);
    } catch (e) {
      return Future.error(e);
    }
  }


}