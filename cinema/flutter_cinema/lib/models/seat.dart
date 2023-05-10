import 'package:equatable/equatable.dart';
import 'package:flutter_cinema/models/seat_type.dart';

class Seat extends Equatable {
  final int id;
  final int index;
  final SeatType type;
  final double price;
  final bool isAvailable;

  const Seat(
    this.id,
    this.index,
    this.type,
    this.price,
    this.isAvailable,
  );

  Seat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        index = json['index'],
        type = SeatType.values.elementAt(json['type']),
        price = double.tryParse(json['price'].toString()) ?? 0.0,
        isAvailable = json['isAvailable'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'index': index,
        'type': type.index,
        'price': price,
        'isAvailable': isAvailable,
      };

  @override
  List<Object?> get props => [id, index, type, price, isAvailable];
}
