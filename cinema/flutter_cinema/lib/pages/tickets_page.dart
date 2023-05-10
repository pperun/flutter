import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/components/delayed_slide_transition.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../bloc/tickets_bloc/tickets_bloc.dart';
import '../components/tickets_page_button.dart';
import '../components/user_page_button.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

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
        body: BlocBuilder<TicketsBloc, TicketsState>(
          builder: (context, state) {
            if (state is TicketsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TicketsLoadedState) {
              return Column(
                children: [
                  Text(
                    'Tickets',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.tickets.length,
                      itemBuilder: (context, index) => DelayedSlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.0, -1.0),
                          end: const Offset(0.0, 0.0),
                        ),
                        delay: Duration(
                          milliseconds: 400 ~/ (index + 1) * index,
                        ),
                        duration: Duration(
                          milliseconds: 400 ~/ (index + 1),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                            ),
                            child: ExpansionTile(
                              textColor: Colors.black,
                              iconColor: Colors.black,
                              leading: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                    state.tickets[index].smallImage),
                              ),
                              title:
                                  Text('Movie: ${state.tickets[index].name}'),
                              subtitle: Text(
                                'Date: ${DateFormat('dd-MM-yyyy HH:mm').format(state.tickets[index].date)}',
                              ),
                              children: [
                                QrImage(
                                  data:
                                      jsonEncode(state.tickets[index].toJSon()),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text((state as TicketsErrorState).error),
              );
            }
          },
        ));
  }
}
