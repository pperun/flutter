import 'package:flutter_cinema/models/seat_row.dart';

class Room {
  final int id;
  final String name;
  final List<SeatRow> rows;

  Room(this.id, this.name, this.rows);

  Room.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        rows = [
          for (Map<String, dynamic> seatRowJson in json['rows'])
            SeatRow.fromJson(seatRowJson)
        ];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'rows': rows.map((e) => e.toJson())};
}
