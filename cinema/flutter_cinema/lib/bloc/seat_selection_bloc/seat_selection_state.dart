part of 'seat_selection_bloc.dart';

abstract class SeatSelectionState extends Equatable {
  const SeatSelectionState();

  @override
  List<Object> get props => [];
}

class SeatSelectionInitialState extends SeatSelectionState {}

class SeatSelectedState extends SeatSelectionState {
  final List<SelectedSeat> indices;

  const SeatSelectedState({required this.indices});

  @override
  List<Object> get props => [...indices];
}
