import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/components/tickets_page_button.dart';

import '../bloc/seat_selection_bloc/seat_selection_bloc.dart';
import '../bloc/ticket_purchase_bloc/ticket_purchase_bloc.dart';
import '../components/purchase_info_form.dart';
import '../components/user_page_button.dart';
import '../models/selected_seat.dart';

class TicketPurchasePage extends StatelessWidget {
  final List<SelectedSeat> selectedSeats;

  const TicketPurchasePage({super.key, required this.selectedSeats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinema'),
        actions: const [
          UserPageButton(),
          TicketsPageButton(),
        ],
        leading: IconButton(
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<TicketPurchaseBloc, TicketPurchaseState>(
        builder: (context, state) {
          if (state is TicketBookedState) {
            return BlocBuilder<SeatSelectionBloc, SeatSelectionState>(
              builder: (context, seatSelectionState) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: PurchaseInfoForm(
                    selectedSeats: state.seatsIndices,
                    sessionId: state.sessionId,
                  ),
                );
              },
            );
          } else if (state is TicketPurchaseInProgressState ||
              state is TicketBookingInProgressState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TicketPurchaseCompletedState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Thank You!',
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Click ",
                            style: Theme.of(context).textTheme.bodyMedium),
                        const WidgetSpan(
                          child: Icon(Icons.archive),
                        ),
                        TextSpan(
                            text: " to see your tickets",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            List<dynamic> error =
                jsonDecode((state as TicketPurchaseErrorState).error ?? '{}');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Finita la commedia',
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                  for (String errorText in error.map((e) => e['error']))
                    Text(errorText),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text('Payment failed. Try again'),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.refresh),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
