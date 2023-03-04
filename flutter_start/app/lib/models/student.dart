import 'package:app/models/person.dart';

class Student extends Person {
  final String university;
  final String faculty;
  final String group;
  final DateTime _enrollmentDate;
  static const status = "Студент";

  Student(super.name, super.surname, super.birthDate, this.university,
      this._enrollmentDate,
      {this.faculty = "Unknown", this.group = "Unknown"});

  int get grade => DateTime.now().difference(_enrollmentDate).inDays ~/ 365;

  DateTime get enrollmentDate => _enrollmentDate;
}
