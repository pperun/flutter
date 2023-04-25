import 'package:flutter_cinema/models/seat.dart';

class SeatRow {
  final int id;
  final int index;
  final List<Seat> seats;

  SeatRow(this.id, this.index, this.seats);

  SeatRow.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        index = json['index'],
        seats = [
          for (Map<String, dynamic> seatJson in json['seats'])
            Seat.fromJson(seatJson)
        ];

  Map<String, dynamic> toJson() => {
        'id': id,
        'index': index,
        'seats': seats
            .map(
              (e) => e.toJson(),
            )
            .toList()
      };
}
