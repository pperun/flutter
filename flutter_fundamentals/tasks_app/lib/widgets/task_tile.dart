import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final void Function(bool?)? onChanged;
  final void Function(DismissDirection)? onDismissed;

  const TaskTile(
      {required super.key,
      required this.task,
      required this.onChanged,
      required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: super.key!,
      background: Container(
        color: Colors.red,
        child: const Center(
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: onDismissed,
      child: CheckboxListTile(
        title: Text(task.name),
        value: task.completed,
        onChanged: onChanged,
      ),
    );
  }
}
