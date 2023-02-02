import 'package:flutter/cupertino.dart';
import 'package:todoey/src/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  get getLength => _tasks.length;

  get getList => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
