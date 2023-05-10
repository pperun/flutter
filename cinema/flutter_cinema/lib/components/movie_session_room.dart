import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/components/seat_widget.dart';
import 'package:flutter_cinema/models/selected_seat.dart';

import '../bloc/seat_selection_bloc/seat_selection_bloc.dart';
import '../models/movie_session.dart';
import '../models/room.dart';
import '../models/seat.dart';
import '../models/seat_row.dart';

class MovieSessionRoom extends StatelessWidget {
  final DateTime date;
  final MovieSession session;

  const MovieSessionRoom(
      {super.key, required this.session, required this.date});

  double _seatSize(BuildContext context, Room room) {
    final int rows = room.rows.length;
    final int seats = room.rows
        .map((e) => e.seats.length)
        .reduce((value, element) => value > element ? value : element);
    return min((MediaQuery.of(context).size.width - 50) / (seats),
        (MediaQuery.of(context).size.width - 50) / (rows));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: InteractiveViewer(
          constrained: true,
          minScale: 1.0,
          maxScale: 4.0,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (SeatRow row in session.room.rows)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (Seat seat in row.seats)
                        BlocBuilder<SeatSelectionBloc, SeatSelectionState>(
                          builder: (context, state) {
                            if (state is SeatSelectedState) {
                              return SeatWidget(
                                seat: seat,
                                color: state.indices
                                        .map((e) => e.seat)
                                        .contains(seat)
                                    ? Colors.green
                                    : null,
                                borderColor: state.indices
                                        .map((e) => e.seat)
                                        .contains(seat)
                                    ? Colors.white
                                    : null,
                                size: Size(
                                  _seatSize(context, session.room),
                                  _seatSize(context, session.room),
                                ),
                                onTap: () {
                                  context.read<SeatSelectionBloc>().add(
                                        SelectSeatEvent(
                                          seat: SelectedSeat(
                                            seat,
                                            row.index,
                                            date,
                                            session.date,
                                            session.id,
                                          ),
                                        ),
                                      );
                                },
                              );
                            } else {
                              return SeatWidget(
                                seat: seat,
                                size: Size(
                                  _seatSize(context, session.room),
                                  _seatSize(context, session.room),
                                ),
                                onTap: () {
                                  context.read<SeatSelectionBloc>().add(
                                        SelectSeatEvent(
                                          seat: SelectedSeat(
                                            seat,
                                            row.index,
                                            date,
                                            session.date,
                                            session.id,
                                          ),
                                        ),
                                      );
                                },
                              );
                            }
                          },
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
