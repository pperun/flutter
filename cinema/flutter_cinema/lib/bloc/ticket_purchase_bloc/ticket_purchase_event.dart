part of 'ticket_purchase_bloc.dart';

abstract class TicketPurchaseEvent extends Equatable {
  const TicketPurchaseEvent();

  @override
  List<Object> get props => [];
}

class BookTicketsEvent extends TicketPurchaseEvent {
  final List<int> seatsIndices;
  final int sessionId;

  const BookTicketsEvent({required this.seatsIndices, required this.sessionId});

  @override
  List<Object> get props => [...seatsIndices, sessionId];
}


class BuyTicketsEvent extends TicketPurchaseEvent {
  final PurchaseInfo info;

  const BuyTicketsEvent({required this.info});

  @override
  List<Object> get props => [info];
}

