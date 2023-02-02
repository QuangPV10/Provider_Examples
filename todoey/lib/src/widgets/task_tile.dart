import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/src/models/task_data.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (value) {
        context.read<TaskData>().updateTask(task);
      },
      value: task.isDone,
      title: Text(
        task.content,
        style: TextStyle(decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
