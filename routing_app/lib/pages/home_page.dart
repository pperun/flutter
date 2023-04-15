import 'package:flutter/material.dart';
import 'package:routing_app/widgets/tab_navigator.dart';

import '../widgets/bottom_navigation.dart';
import '../widgets/tab_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _currentTab = TabItem.red;
  final _navigatorKeys = {
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Offstage(
          offstage: _currentTab != TabItem.red,
          child: TabNavigator(
            navigatorKey: _navigatorKeys[TabItem.red],
            tabItem: TabItem.red,
          ),
        ),
        Offstage(
          offstage: _currentTab != TabItem.green,
          child: TabNavigator(
            navigatorKey: _navigatorKeys[TabItem.green],
            tabItem: TabItem.green,
          ),
        ),
        Offstage(
          offstage: _currentTab != TabItem.blue,
          child: TabNavigator(
            navigatorKey: _navigatorKeys[TabItem.blue],
            tabItem: TabItem.blue,
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: (tabItem) {
          if (tabItem == _currentTab) {
            _navigatorKeys[tabItem]!
                .currentState!
                .popUntil((route) => route.isFirst);
          } else {
            setState(() => _currentTab = tabItem);
          }
        },
      ),
    );
  }
}
