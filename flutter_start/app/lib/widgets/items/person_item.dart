import 'package:flutter/material.dart';

import '../../models/person.dart';
import 'list_item.dart';

class PersonItem implements ListItem {
  const PersonItem(this.person);

  final Person person;

  @override
  Widget details(BuildContext context) {
    return Column(
      children: [
        Text(
            'Дата народження: ${person.birthDate.day}.${person.birthDate.month}.${person.birthDate.year}'),
        Text('Вік: ${person.age}')
      ],
    );
  }

  @override
  Widget subtitle(BuildContext context) {
    return const Text(Person.status);
  }

  @override
  Widget title(BuildContext context) {
    return Text(person.fullName);
  }
}
