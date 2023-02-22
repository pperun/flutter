class Person {
  final String name;
  final String surname;
  final DateTime birthDate;
  static const status = "Людина"; 

  Person(this.name, this.surname, this.birthDate);

  String get fullName => "$name $surname";

  int get age => DateTime.now().difference(birthDate).inDays ~/ 365;
}
