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
  late Map<Task, Set<Task>> data;
  final controller = TextEditingController();
  bool addTask = false;
  Function getDate(int year) => (int month) => (int day) => '$day.$month.$year'; 

  @override
  void initState() {
    super.initState();
    data = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Text('ToDoDo'),
          Text(getDate(DateTime.now().year)(DateTime.now().month)(DateTime.now().day))
        ],
      ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  key: ValueKey(data.keys.elementAt(index).id),
                  task: data.keys.elementAt(index),
                  subtasks: data[data.keys.elementAt(index)]?.toList() ?? [],
                  onDismissed: (direction) {
                    setState(() {
                      data.remove(data.keys.elementAt(index));
                    });
                  },
                );
              },
            ),
          ),
          InputTextField(
            controller: controller,
            onSubmitted: (text) {
              setState(() {
                if (text.isNotEmpty) {
                  data.putIfAbsent(Task(name: text), () => <Task>{});
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
