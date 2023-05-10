part of 'seat_selection_bloc.dart';

abstract class SeatSelectionEvent extends Equatable {
  const SeatSelectionEvent();

  @override
  List<Object> get props => [];
}

class SelectSeatEvent extends SeatSelectionEvent {
  final SelectedSeat seat;

  const SelectSeatEvent({required this.seat});

  @override
  List<Object> get props => [seat];
}

class FinishSelectingEvent extends SeatSelectionEvent {
  const FinishSelectingEvent();

  @override
  List<Object> get props => [];
}
