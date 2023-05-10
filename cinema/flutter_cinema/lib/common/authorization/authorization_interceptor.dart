import 'package:dio/dio.dart';
import 'package:flutter_cinema/data_sources/authorization_data_source.dart';
import 'package:flutter_cinema/data_sources/local_data_source.dart';

class AuthorizationInterceptor implements Interceptor {
  
  final localDataSource = LocalDataSource();
  final authDataSource = AuthorizationDataSource();
  
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    
    final token = await localDataSource.getToken();
    if(token != null) {
      options.headers[LocalDataSource.authKey] = token;
    }
    else {
      final sessionToken = await authDataSource.getToken();
      localDataSource.setToken('Bearer $sessionToken');
      options.headers[LocalDataSource.authKey] = 'Bearer $sessionToken';
    }
    handler.next(options);
  }
  
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if(err.response!.statusCode == 401) {
      final sessionToken = await authDataSource.getToken();
      localDataSource.setToken('Bearer $sessionToken');
    }
    handler.next(err);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
