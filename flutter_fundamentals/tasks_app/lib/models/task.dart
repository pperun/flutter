import 'package:tasks_app/models/unique_identifier.dart';

class Task with UniqueIdentifier {
  final String name;
  late bool completed;

  Task({this.name = "Unknown", this.completed = false}) : assert(name.isNotEmpty);

  Task.fromJson(Map<String, dynamic> json) : name = json['name'], completed = json['completed'];

  Map<String, dynamic> toJson() => {'name': name, 'completed': completed};
}