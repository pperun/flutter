import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/selected_seat.dart';

class SelectedSeatListTile extends StatelessWidget {
  final SelectedSeat seat;

  const SelectedSeatListTile({super.key, required this.seat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Row ${seat.row} Seat ${seat.seat.index}'),
              Text(
                  'Date: ${DateFormat('dd-MM-yyyy').format(seat.date)} ${DateFormat.Hm().format(seat.time)}')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Seat type: ${seat.seat.type.name}'),
              Text('Price: ${seat.seat.price}'),
            ],
          ),
        ],
      ),
    );
  }
}
