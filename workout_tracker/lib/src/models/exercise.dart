class Exercise {
  final String name;
  final String weight;
  final String reps;
  final String sets;
  bool isComplete;

  Exercise({this.isComplete = false, required this.name, required this.reps, required this.sets, required this.weight});
}
