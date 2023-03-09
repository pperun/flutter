import 'package:flutter/material.dart';
import 'package:tasks_app/widgets/sub_task_tile.dart';

import '../models/task.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final void Function(DismissDirection)? onDismissed;
  final List<Task> subtasks;

  const TaskTile(
      {required super.key,
      required this.task,
      required this.onDismissed,
      required this.subtasks});

  @override
  State<StatefulWidget> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool addSubtask = false;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.key!,
      background: Container(
        color: Colors.red,
        child: const Center(
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: widget.onDismissed,
      child: ExpansionTile(
        title: Text(widget.task.name),
        subtitle: addSubtask
            ? TextField(
                controller: controller,
                onSubmitted: (value) => setState(() {
                  if (controller.text.isNotEmpty) {
                    widget.subtasks.add(Task(name: controller.text));
                  }
                  addSubtask = false;
                  controller.clear();
                }),
              )
            : null,
        controlAffinity: ListTileControlAffinity.leading,
        trailing: IconButton(
            onPressed: () => setState(() => addSubtask = true),
            icon: const Icon(Icons.add)),
        children: [
          for (Task task in widget.subtasks)
            SubTaskTile(key: ValueKey(task.id), task: task),
        ],
      ),
    );
  }
}
