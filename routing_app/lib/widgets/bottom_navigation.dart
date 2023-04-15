import 'package:flutter/material.dart';
import 'package:routing_app/widgets/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.layers,
            color: currentTab == TabItem.red ? TabItem.red.color : Colors.grey,
          ),
          label: TabItem.red.name,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.layers,
            color:
                currentTab == TabItem.green ? TabItem.green.color : Colors.grey,
          ),
          label: TabItem.green.name,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.layers,
            color:
                currentTab == TabItem.blue ? TabItem.blue.color : Colors.grey,
          ),
          label: TabItem.blue.name,
        ),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: currentTab.color,
    );
  }
}
