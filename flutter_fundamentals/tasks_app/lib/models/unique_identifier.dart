import 'package:uuid/uuid.dart';

mixin UniqueIdentifier {
  final String _id = const Uuid().v1();

  String get id => _id;
}