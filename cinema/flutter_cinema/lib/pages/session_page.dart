import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/bloc/movie_session_bloc/movie_session_bloc.dart';
import 'package:flutter_cinema/bloc/ticket_purchase_bloc/ticket_purchase_bloc.dart';
import 'package:flutter_cinema/components/cinema_tab_bar.dart';
import 'package:flutter_cinema/components/delayed_slide_transition.dart';
import 'package:flutter_cinema/components/selected_seats_list.dart';
import 'package:flutter_cinema/repositories/seat_selection_repository.dart';
import 'package:flutter_cinema/repositories/ticket_purchase_repository.dart';
import 'package:intl/intl.dart';

import '../bloc/seat_selection_bloc/seat_selection_bloc.dart';
import '../components/movie_session_room.dart';
import '../components/square_tab.dart';
import '../components/tickets_page_button.dart';
import '../components/user_page_button.dart';
import '../models/movie.dart';
import '../models/movie_session.dart';

class SessionPage extends StatelessWidget {
  final Movie movie;
  final DateTime date;

  const SessionPage({super.key, required this.date, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: const [
          UserPageButton(),
          TicketsPageButton(),
        ],
      ),
      body: BlocBuilder<MovieSessionBloc, MovieSessionState>(
        builder: (context, sessionState) {
          if (sessionState is MovieSessionsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (sessionState is MovieSessionsLoadedState) {
            return DefaultTabController(
              length: sessionState.movieSessions.length,
              child: Column(
                children: [
                  DelayedSlideTransition(
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
                    child: CinemaTabBar(
                      tabs: [
                        for (MovieSession session in sessionState.movieSessions)
                          SquareTab(
                            child: Text(DateFormat.Hm().format(session.date)),
                          )
                      ],
                    ),
                  ),
                  Expanded(
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => SeatSelectionBloc(
                            repository: SeatSelectionRepositoryImpl(),
                          ),
                        ),
                        BlocProvider(
                          create: (context) => TicketPurchaseBloc(
                            repository: TicketPurchaseRepositoryImpl(),
                          ),
                        ),
                      ],
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          for (MovieSession session
                              in sessionState.movieSessions)
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  DelayedSlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0.0, -1.0),
                                      end: const Offset(0.0, 0.0),
                                    ),
                                    delay: const Duration(
                                      milliseconds: 200,
                                    ),
                                    duration: const Duration(
                                      milliseconds: 200,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              blurStyle: BlurStyle.outer,
                                            ),
                                          ],
                                        ),
                                        child: MovieSessionRoom(
                                          session: session,
                                          date: date,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SelectedSeatsList(
                                    sessionId: session.id,
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text((sessionState as MovieSessionsErrorState).error),
            );
          }
        },
      ),
    );
  }
}
