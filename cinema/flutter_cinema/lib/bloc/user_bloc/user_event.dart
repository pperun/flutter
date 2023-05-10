part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  const LoadUser();

  @override
  List<Object> get props => [];
}

class UpdateUser extends UserEvent {
  final Map<String, dynamic> fields;

  const UpdateUser({required this.fields});

  @override
  List<Object> get props => [fields];
}
