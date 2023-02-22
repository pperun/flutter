import 'package:flutter/material.dart';

import '../../models/student.dart';
import 'list_item.dart';

class StudentItem implements ListItem {
  const StudentItem(this.student);

  final Student student;

  @override
  Widget details(BuildContext context) {
    return Column(
      children: [
        Text(
            'Дата народження: ${student.birthDate.day}.${student.birthDate.month}.${student.birthDate.year}'),
        Text('Вік: ${student.age}'),
        Text('Університет: ${student.university}'),
        Text('Факультет: ${student.faculty}'),
        Text('Група: ${student.group}'),
        Text('Курс: ${student.grade}')
      ],
    );
  }

  @override
  Widget subtitle(BuildContext context) {
    return const Text(Student.status);
  }

  @override
  Widget title(BuildContext context) {
    return Text(student.fullName);
  }
}
