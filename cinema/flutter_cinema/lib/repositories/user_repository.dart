import 'package:flutter_cinema/data_sources/network_data_source.dart';

import '../models/user.dart';

abstract class UserRepository {
  Future<User> fetchUser();
  Future<User> updateUser(Map<String, dynamic> fields);
}

class UserRepositoryImpl implements UserRepository {
  
  final dataSource = NetworkDataSourceImpl();
  
  @override
  Future<User> fetchUser() async {
    try {
      return await dataSource.fetchUser();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<User> updateUser(Map<String, dynamic> fields) async {
    try {
      return await dataSource.updateUser(fields);
    } catch (e) {
      return Future.error(e);
    }
  }
}