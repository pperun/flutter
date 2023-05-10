import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cinema/common/authorization/authorization_interceptor.dart';
import 'package:flutter_cinema/models/purchase_info.dart';

import '../models/movie.dart';
import '../models/movie_session.dart';
import '../models/ticket.dart';
import '../models/user.dart';

abstract class NetworkDataSource {
  static const String apiUrl = '';
  static const String secretKey = '';
}

class NetworkDataSourceImpl extends NetworkDataSource {
  static final NetworkDataSourceImpl _instance =
      NetworkDataSourceImpl._internal();

  final _dio = Dio();

  NetworkDataSourceImpl._internal() {
    _dio.options.validateStatus = (statusCode) {
      if (statusCode == null) {
        return false;
      }
      if (statusCode == 422) {
        return true;
      } else {
        return statusCode >= 200 && statusCode < 300;
      }
    };
    _dio.interceptors.add(AuthorizationInterceptor());
  }

  factory NetworkDataSourceImpl() => _instance;

  Future<List<Movie>> fetchMovies(DateTime date) async {
    try {
      Response response = await _dio.get(
        '${NetworkDataSource.apiUrl}/api/movies',
        queryParameters: {
          'date': '${date.year}-${date.month}-${date.day}',
          'query': ''
        },
      );
      if (response.statusCode == 200) {
        return (response.data['data'] as List<dynamic>)
            .map((e) => Movie.fromJson(e))
            .toList();
      }
      return Future.error(Exception('Fetch failed'));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<MovieSession>> fetchMovieSessions(
      int movieId, DateTime date) async {
    try {
      Response response = await _dio.get(
        '${NetworkDataSource.apiUrl}/api/movies/sessions',
        queryParameters: {
          'movieId': movieId,
          'date': '${date.year}-${date.month}-${date.day}',
        },
      );
      if (response.statusCode == 200) {
        return (response.data['data'] as List<dynamic>)
            .map((e) => MovieSession.fromJson(e))
            .toList();
      }
      return Future.error(Exception('Fetch failed'));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<User> fetchUser() async {
    try {
      Response response =
          await _dio.get('${NetworkDataSource.apiUrl}/api/user');
      if (response.statusCode == 200) {
        return User.fromJson(response.data['data']);
      }
      return Future.error(Exception('Fetch failed'));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<User> updateUser(Map<String, dynamic> fields) async {
    try {
      Response response =
          await _dio.post('${NetworkDataSource.apiUrl}/api/user', data: fields);
      if (response.statusCode == 200) {
        return User.fromJson(response.data['data']);
      }
      return Future.error(Exception('Update failed'));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> bookTickets(List<int> seatsIndices, int sessionId) async {
    try {
      Response response =
          await _dio.post('${NetworkDataSource.apiUrl}/api/movies/book', data: {
        'seats': seatsIndices,
        'sessionId': sessionId,
      });
      if (response.statusCode == 200) {
        return response.data['data'];
      }
      return Future.error(Exception('Booking failed'));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Ticket>> fetchTickets() async {
    try {
      Response response =
          await _dio.get('${NetworkDataSource.apiUrl}/api/user/tickets');
      if (response.statusCode == 200) {
        return (response.data['data'] as List<dynamic>)
            .map((e) => Ticket.fromJson(e))
            .toList();
      }
      return Future.error(Exception('Fetch failed'));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> buyTickets(PurchaseInfo info) async {
    try {
      Response response = await _dio.post(
          '${NetworkDataSource.apiUrl}/api/movies/buy',
          data: info.toJson());
      if (response.statusCode == 200) {
        return response.data['data'];
      }
      return Future.error(jsonEncode(response.data['data']));
    } catch (e) {
      return Future.error(e);
    }
  }
}
