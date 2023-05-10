import 'package:flutter_bloc/flutter_bloc.dart';

class FlipCubit extends Cubit<bool> {
  FlipCubit() : super(false);

  void flip() {
    emit(!state);
  }
}
