import 'package:app/models/citizen.dart';
import 'package:app/widgets/items/citizen_item.dart';
import 'package:flutter/material.dart';

import '../models/person.dart';
import '../models/student.dart';
import 'items/list_item.dart';
import 'items/person_item.dart';
import 'items/student_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static List<ListItem> items = [
    PersonItem(
      Person("Павло", "Перун", DateTime(2002, 12, 7))
    ),
    StudentItem(
      Student("Павло", "Перун", DateTime(2002, 12, 7), "КПІ", DateTime(2019),faculty: "IATE", group: "TI-92")
    ),
    CitizenItem(
      Citizen("Павло", "Перун", DateTime(2002, 12, 7), "АБ123456789", "1234567890")
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Person Page')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: items[index].title(context),
            subtitle: items[index].subtitle(context),
            //children: [items[index].details(context)],
          );
        },
      ),
    );
  }
}