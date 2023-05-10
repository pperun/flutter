part of 'ticket_purchase_bloc.dart';

abstract class TicketPurchaseState extends Equatable {
  const TicketPurchaseState();

  @override
  List<Object> get props => [];
}

class TicketBookingInProgressState extends TicketPurchaseState {}

class TicketBookedState extends TicketPurchaseState {
  final List<int> seatsIndices;
  final int sessionId;

  const TicketBookedState(
      {required this.seatsIndices, required this.sessionId});

  @override
  List<Object> get props => [seatsIndices, sessionId];
}

class TicketPurchaseErrorState extends TicketPurchaseState {
  final String? error;

  const TicketPurchaseErrorState({this.error});

  @override
  List<Object> get props => [error ?? ''];
}

class TicketPurchaseInProgressState extends TicketPurchaseState {}

class TicketPurchaseCompletedState extends TicketPurchaseState {
  final PurchaseInfo info;

  const TicketPurchaseCompletedState({required this.info});

  @override
  List<Object> get props => [info];
}
