import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../pages/user_page.dart';
import '../repositories/user_repository.dart';

class UserPageButton extends StatelessWidget {
  const UserPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => UserBloc(
              repository: UserRepositoryImpl(),
            )..add(const LoadUser()),
            child: const UserPage(),
          ),
        ),
      ),
      icon: const Icon(Icons.account_circle),
    );
  }
}
