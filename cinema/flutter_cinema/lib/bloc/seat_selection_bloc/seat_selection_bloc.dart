import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/selected_seat.dart';
import '../../repositories/seat_selection_repository.dart';

part 'seat_selection_event.dart';
part 'seat_selection_state.dart';

class SeatSelectionBloc extends Bloc<SeatSelectionEvent, SeatSelectionState> {
  final SeatSelectionRepository repository;

  SeatSelectionBloc({required this.repository})
      : super(SeatSelectionInitialState()) {
    on<SelectSeatEvent>((event, emit) {
      repository.selectSeat(event.seat);
      repository.selectedSeats.isEmpty
          ? emit(SeatSelectionInitialState())
          : emit(
              SeatSelectedState(indices: List.from(repository.selectedSeats)));
    });
    on<FinishSelectingEvent>(
      (event, emit) {
        repository.clearSelectedIndices();
        emit(SeatSelectedState(indices: List.from(repository.selectedSeats)));
      },
    );
  }

  List<SelectedSeat> getSelectedIndices() => repository.selectedSeats;
}
