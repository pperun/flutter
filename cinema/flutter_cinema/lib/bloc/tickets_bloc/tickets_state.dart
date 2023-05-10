part of 'tickets_bloc.dart';

abstract class TicketsState extends Equatable {
  const TicketsState();

  @override
  List<Object> get props => [];
}

class TicketsLoadingState extends TicketsState {}

class TicketsLoadedState extends TicketsState {
  final List<Ticket> tickets;

  const TicketsLoadedState({this.tickets = const <Ticket>[]});

  @override
  List<Object> get props => [tickets];
}

class TicketsErrorState extends TicketsState {
  final String error;

  const TicketsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}