import 'package:flutter_cinema/models/room.dart';

class MovieSession {
  final int id;
  final DateTime date;
  final String type;
  final double minPrice;
  final Room room;

  MovieSession(this.id, this.date, this.type, this.minPrice, this.room);

  MovieSession.fromJson(Map<String, dynamic> json)
      : id = json['data']['id'],
        date = DateTime.fromMillisecondsSinceEpoch(json['data']['date']),
        type = json['data']['type'],
        minPrice = double.tryParse(json['data']['minPrice']) ?? 0.0,
        room = Room.fromJson(json['data']['room']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.millisecondsSinceEpoch,
        'type': type,
        'minPrice': minPrice,
        'room': room.toJson(),
      };
}
