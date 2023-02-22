import 'package:app/models/person.dart';

class Student extends Person {
  final String university;
  final String faculty;
  final String group;
  final DateTime enrollmentDate;
  static const status = "Студент";

  Student(super.name, super.surname, super.birthDate, this.university,
      this.enrollmentDate,
      {this.faculty = "Unknown", this.group = "Unknown"});

  int get grade => DateTime.now().difference(enrollmentDate).inDays ~/ 365;
}
