import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cinema/repositories/user_repository.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc({required this.repository}) : super(UserLoadingState()) {
    on<LoadUser>((event, emit) async {
      try {
        final user = await repository.fetchUser();
        emit(UserLoadedState(user: user));
      } catch (e) {
        emit(UserErrorState(error: e.toString()));
      }
    });
    on<UpdateUser>(
      (event, emit) async {
        try {
          emit(UserUpdatingState());
          final user = await repository.updateUser(event.fields);
          emit(UserUpdatedState(user: user));
        } catch (e) {
          emit(UserErrorState(error: e.toString()));
        }
      },
    );
  }
}
