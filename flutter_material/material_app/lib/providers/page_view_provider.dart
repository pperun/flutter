import 'package:flutter/material.dart';

class PageViewProvider with ChangeNotifier {
  PageViewProvider({this.pages = 0})
      : navigatorKeys = [
          for (int i = 0; i < pages; i++) GlobalKey<NavigatorState>()
        ];

  int _currentIndex = 0;
  int pages;
  List<GlobalKey<NavigatorState>> navigatorKeys;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    if (index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    } else {
      if (navigatorKeys[_currentIndex].currentState!.canPop()) {
        navigatorKeys[_currentIndex].currentState!.pop();
      }
    }
  }
}
