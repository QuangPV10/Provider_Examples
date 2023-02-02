class Task {
  final String content;
  bool isDone;

  Task({required this.content, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
