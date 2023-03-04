import 'package:uuid/uuid.dart';

class Task {
  final String id = const Uuid().v1();
  final String name;
  late bool completed;

  Task({required this.name, this.completed = false}) : assert(name.isNotEmpty);

  Task.fromJson(Map<String, dynamic> json) : name = json['name'], completed = json['completed'];

  Map<String, dynamic> toJson() => {'name': name, 'completed': completed};
}