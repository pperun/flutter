import 'package:equatable/equatable.dart';
import 'package:flutter_cinema/models/seat.dart';

class SelectedSeat extends Equatable {
  final Seat seat;
  final int row;
  final DateTime date;
  final DateTime time;
  final int sessionId;

  const SelectedSeat(this.seat, this.row, this.date, this.time, this.sessionId);
  
  @override
  List<Object?> get props => [...seat.props, row, date, time, sessionId];
}