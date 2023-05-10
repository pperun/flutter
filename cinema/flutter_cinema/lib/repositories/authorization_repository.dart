import 'package:flutter_cinema/data_sources/authorization_data_source.dart';

abstract class AuthorizationRepository {
  Future<String> getToken();
}

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final authorizationDataSource = AuthorizationDataSource();
  
  @override
  Future<String> getToken() async {
    return await authorizationDataSource.getToken();
  }
}