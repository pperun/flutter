import 'package:app/models/person.dart';

class Citizen extends Person {
  final String passport;
  final String taxpayerID;
  final String address;
  static const status = "Громадянин";

  Citizen(super.name, super.surname, super.birthDate, this.passport, this.taxpayerID, {this.address="-"});
}