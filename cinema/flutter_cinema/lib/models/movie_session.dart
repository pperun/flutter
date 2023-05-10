import 'package:flutter_cinema/models/room.dart';

class MovieSession {
  final int id;
  final DateTime date;
  final String type;
  final double minPrice;
  final Room room;

  MovieSession(this.id, this.date, this.type, this.minPrice, this.room);

  MovieSession.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000),
        type = json['type'],
        minPrice = double.tryParse(json['minPrice'].toString()) ?? 0.0,
        room = Room.fromJson(json['room']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.millisecondsSinceEpoch,
        'type': type,
        'minPrice': minPrice,
        'room': room.toJson(),
      };
}
