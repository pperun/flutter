import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/seat_selection_bloc/seat_selection_bloc.dart';
import '../bloc/ticket_purchase_bloc/ticket_purchase_bloc.dart';
import 'button.dart';

class BookTicketButton extends StatelessWidget {
  final int sessionId;

  const BookTicketButton({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketPurchaseBloc, TicketPurchaseState>(
      builder: (context, state) {
        return BlocProvider.of<SeatSelectionBloc>(context)
                .getSelectedIndices()
                .isEmpty
            ? Container()
            : Container(
                padding: const EdgeInsets.all(10),
                child: Button(
                  onTap: () {
                    context.read<TicketPurchaseBloc>().add(
                          BookTicketsEvent(
                            seatsIndices: context
                                .read<SeatSelectionBloc>()
                                .getSelectedIndices()
                                .map((e) => e.seat.id)
                                .toList(),
                            sessionId: sessionId,
                          ),
                        );
                  },
                  child: Text(
                      'Buy for ${BlocProvider.of<SeatSelectionBloc>(context).getSelectedIndices().map(
                            (e) => e.seat.price,
                          ).reduce((value, element) => value + element)}'),
                ),
              );
      },
    );
  }
}
