import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cinema/components/user_form.dart';

import '../bloc/user_bloc/user_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cinema')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoadedState) {
            return UserForm(user: state.user);
          } else if (state is UserUpdatingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserUpdatedState) {
            return UserForm(user: state.user);
          } else {
            return Center(
              child: Text((state as UserErrorState).error),
            );
          }
        },
      ),
    );
  }
}
