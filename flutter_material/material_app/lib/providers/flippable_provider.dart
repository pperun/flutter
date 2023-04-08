import 'package:flutter/material.dart';

class FlippableProvider with ChangeNotifier {
  Side side = Side.front;

  void flip() {
    side == Side.front ? side = Side.back : side = Side.front;
    notifyListeners();
  }
}

enum Side {
  front,
  back;
}
