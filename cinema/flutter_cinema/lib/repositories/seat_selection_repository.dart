import '../models/selected_seat.dart';

abstract class SeatSelectionRepository {
  bool selectSeat(SelectedSeat seat);
  List<SelectedSeat> get selectedSeats;
  void clearSelectedIndices();
}

class SeatSelectionRepositoryImpl implements SeatSelectionRepository {
  int selectedSessionId = 0;
  final List<SelectedSeat> _selectedSeats = [];

  SeatSelectionRepositoryImpl();

  @override
  bool selectSeat(SelectedSeat seat) {
    if (selectedSessionId == seat.sessionId) {
      if (_selectedSeats.contains(seat)) {
        _selectedSeats.removeWhere((element) => element == seat);
        return false;
      }
    }
    else {
      selectedSessionId = seat.sessionId;
      _selectedSeats.clear();
    }

    _selectedSeats.add(seat);
    return true;
  }

  @override
  List<SelectedSeat> get selectedSeats => _selectedSeats;

  @override
  void clearSelectedIndices() {
    _selectedSeats.clear();
  }
}
