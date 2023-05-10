import '../data_sources/network_data_source.dart';
import '../models/ticket.dart';

abstract class TicketsRepository {
  Future<List<Ticket>> fetchTickets();
}

class TicketsRepositoryImpl implements TicketsRepository {
  final dataSource = NetworkDataSourceImpl();

  TicketsRepositoryImpl();

  @override
  Future<List<Ticket>> fetchTickets() async {
    try {
      return await dataSource.fetchTickets();
    } catch (e) {
      return Future.error(e);
    }
  }
}