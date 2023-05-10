import 'package:flutter_cinema/data_sources/network_data_source.dart';

import '../models/purchase_info.dart';

abstract class TicketPurchaseRepository {
  Future<bool> bookTickets(List<int> seatsIndices, int sessionId);
  Future<bool> buyTickets(PurchaseInfo info);
}

class TicketPurchaseRepositoryImpl implements TicketPurchaseRepository {
  final dataSource = NetworkDataSourceImpl();
  
  @override
  Future<bool> bookTickets(List<int> seatsIndices, int sessionId) async {
    try {
      return await dataSource.bookTickets(seatsIndices, sessionId);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<bool> buyTickets(PurchaseInfo info) async {
    try {
      return await dataSource.buyTickets(info);
    } catch (e) {
      return Future.error(e);
    }
  }

}