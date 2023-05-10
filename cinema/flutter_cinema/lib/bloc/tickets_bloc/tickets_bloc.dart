import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/ticket.dart';
import '../../repositories/tickets_repository.dart';

part 'tickets_event.dart';
part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final TicketsRepository repository;

  TicketsBloc({required this.repository})
      : super(TicketsLoadingState()) {
    on<LoadTickets>((event, emit) async {
      try {
        final tickets = await repository.fetchTickets();
        emit(TicketsLoadedState(tickets: tickets));
      } catch (e) {
        emit(TicketsErrorState(error: e.toString()));
      }
    });
  }
}