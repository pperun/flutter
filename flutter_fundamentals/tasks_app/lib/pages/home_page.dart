import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/input_text_field.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> data = [];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoDo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  key: ValueKey(data[index].id),
                  task: data[index],
                  onChanged: (value) {
                    setState(() {
                      data[index].completed = !data[index].completed;
                    });
                  },
                  onDismissed: (direction) {
                    setState(() {
                      data.removeAt(index);
                    });
                  },
                );
              },
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  oldIndex < newIndex
                      ? data.insert(--newIndex, data.removeAt(oldIndex))
                      : data.insert(newIndex, data.removeAt(oldIndex));
                });
              },
            ),
          ),
          InputTextField(
            controller: controller,
            onSubmitted: (text) {
              setState(() {
                if (text.isNotEmpty) {
                  data.add(Task(name: text));
                }
                controller.clear();
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
