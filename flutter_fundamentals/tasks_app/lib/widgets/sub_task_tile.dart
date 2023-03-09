import 'package:flutter/material.dart';

import '../models/task.dart';

class SubTaskTile extends StatefulWidget {
  final Task task;

  const SubTaskTile({super.key, required this.task});

  @override
  State<StatefulWidget> createState() => _SubTaskListTileState();
}

class _SubTaskListTileState extends State<SubTaskTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.task.name),
      value: widget.task.completed,
      onChanged: ((value) {
        setState(() {
           widget.task.completed = !widget.task.completed;
        });
      }),
    );
  }
}
