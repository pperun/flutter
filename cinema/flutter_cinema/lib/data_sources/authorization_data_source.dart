import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cinema/data_sources/network_data_source.dart';

class AuthorizationDataSource extends NetworkDataSource {
  
  final dio = Dio();

  AuthorizationDataSource();
  
  Future<String> getToken() async {
    try {
      Response sessionResponse = await dio.post('${NetworkDataSource.apiUrl}/api/auth/session');
      if (sessionResponse.statusCode == 200) {
        Response sessionTokenResponse =
            await dio.post('${NetworkDataSource.apiUrl}/api/auth/token', data: {
          'sessionToken': sessionResponse.data['data']['sessionToken'],
          'signature': sha256.convert(
            utf8.encode(sessionResponse.data['data']['sessionToken']) +
                utf8.encode(NetworkDataSource.secretKey),
          ).toString()
        });
        if (sessionTokenResponse.statusCode == 200) {
          return sessionTokenResponse.data['data']['sessionToken'];
        }
      }
      return Future.error('Authorization failed');
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}