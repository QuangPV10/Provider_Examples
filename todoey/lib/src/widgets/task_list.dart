import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/src/models/task_data.dart';
import 'package:todoey/src/widgets/task_tile.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({required this.tasks, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Row(
          children: [
            Expanded(
              child: TaskTile(
                task: task,
              ),
            ),
            IconButton(
                onPressed: () {
                  context.read<TaskData>().deleteTask(index);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        );
      },
    );
  }
}
