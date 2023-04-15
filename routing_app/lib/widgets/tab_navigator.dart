import 'package:flutter/material.dart';
import 'package:routing_app/pages/colors_list_page.dart';
import 'package:routing_app/widgets/tab_item.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => ColorsListPage(
                color: tabItem.color,
                title: tabItem.name,
              ),
            );
        }
      },
    );
  }
}
