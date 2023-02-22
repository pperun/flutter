import 'package:flutter/material.dart';

import '../../models/citizen.dart';
import 'list_item.dart';

class CitizenItem implements ListItem {
  const CitizenItem(this.citizen);

  final Citizen citizen;

  @override
  Widget details(BuildContext context) {
    return Column(
      children: [
        Text(
            'Дата народження: ${citizen.birthDate.day}.${citizen.birthDate.month}.${citizen.birthDate.year}'),
        Text('Вік: ${citizen.age}'),
        Text('Серія і номер паспорта: ${citizen.passport}'),
        Text('ІПН: ${citizen.taxpayerID}')
      ],
    );
  }

  @override
  Widget subtitle(BuildContext context) {
    return const Text(Citizen.status);
  }

  @override
  Widget title(BuildContext context) {
    return Text(citizen.fullName);
  }
}
