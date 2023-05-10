import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tickets_bloc/tickets_bloc.dart';
import '../pages/tickets_page.dart';
import '../repositories/tickets_repository.dart';

class TicketsPageButton extends StatelessWidget {
  const TicketsPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => TicketsBloc(
              repository: TicketsRepositoryImpl(),
            )..add(const LoadTickets()),
            child: const TicketsPage(),
          ),
        ),
      ),
      icon: const Icon(Icons.archive_rounded),
    );
  }
}
