import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/components/delayed_slide_transition.dart';
import 'package:flutter_cinema/components/selected_seat_list_tile.dart';

import '../bloc/seat_selection_bloc/seat_selection_bloc.dart';
import '../bloc/ticket_purchase_bloc/ticket_purchase_bloc.dart';
import '../models/selected_seat.dart';
import '../pages/ticket_purchase_page.dart';
import 'book_ticket_button.dart';

class SelectedSeatsList extends StatelessWidget {
  final int sessionId;

  const SelectedSeatsList({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeatSelectionBloc, SeatSelectionState>(
      builder: (context, state) {
        if (state is SeatSelectionInitialState) {
          return Container();
        }
        if (state is SeatSelectedState) {
          return Column(
            children: [
              for (SelectedSeat seat in state.indices)
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: DelayedSlideTransition(
                    position: Tween<Offset>(
                    begin: const Offset(0.0, -1.0),
                    end: const Offset(0.0, 0.0),
                  ),
                  delay: const Duration(
                    milliseconds: 0,
                  ),
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                    child: SelectedSeatListTile(
                      seat: seat,
                    ),
                  ),
                ),
              BlocListener<TicketPurchaseBloc, TicketPurchaseState>(
                listener: (context, state) {
                  if (state is TicketBookingInProgressState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tickets booking...')));
                  } else if (state is TicketBookedState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (newContext) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                              value: context.read<SeatSelectionBloc>(),
                            ),
                            BlocProvider.value(
                              value: context.read<TicketPurchaseBloc>(),
                            ),
                          ],
                          child: TicketPurchasePage(
                            selectedSeats: context
                                .read<SeatSelectionBloc>()
                                .getSelectedIndices(),
                          ),
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Tickets booked'),
                      ),
                    );
                  } else if (state is TicketPurchaseErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Ticket booking failed'),
                      ),
                    );
                  }
                },
                child: DelayedSlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, -1.0),
                    end: const Offset(0.0, 0.0),
                  ),
                  delay: const Duration(
                    milliseconds: 0,
                  ),
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  child: BookTicketButton(
                    sessionId: sessionId,
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
