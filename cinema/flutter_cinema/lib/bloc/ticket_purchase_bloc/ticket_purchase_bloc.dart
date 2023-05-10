import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cinema/models/purchase_info.dart';

import '../../repositories/ticket_purchase_repository.dart';

part 'ticket_purchase_event.dart';
part 'ticket_purchase_state.dart';

class TicketPurchaseBloc
    extends Bloc<TicketPurchaseEvent, TicketPurchaseState> {
  final TicketPurchaseRepository repository;

  TicketPurchaseBloc({required this.repository})
      : super(TicketBookingInProgressState()) {
    on<BookTicketsEvent>(
      (event, emit) async {
        try {
          final success = await repository.bookTickets(
              List.from(event.seatsIndices), event.sessionId);
          success
              ? emit(TicketBookedState(
                  seatsIndices: List.from(event.seatsIndices),
                  sessionId: event.sessionId))
              : emit(const TicketPurchaseErrorState(
                  error: 'Ticket booking failed'));
        } catch (e) {
          emit(TicketPurchaseErrorState(error: e.toString()));
        }
      },
    );
    on<BuyTicketsEvent>((event, emit) async {
      try {
        emit(TicketPurchaseInProgressState());
        final success = await repository.buyTickets(event.info);
        success
            ? emit(TicketPurchaseCompletedState(info: event.info))
            : emit(const TicketPurchaseErrorState(
                error: 'Ticket purchase failed'));
      } catch (e) {
        emit(TicketPurchaseErrorState(error: e.toString()));
      }
    });
  }
}
