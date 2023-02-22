import 'package:flutter/material.dart';

class ExerciseTitle extends StatelessWidget {
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isComplete;
  final void Function(bool?) onCheckBoxChange;
  const ExerciseTitle(
      {required this.exerciseName,
      required this.isComplete,
      required this.onCheckBoxChange,
      required this.reps,
      required this.sets,
      required this.weight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(exerciseName),
      subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Chip(label: Text('$weight kg')),
        Chip(label: Text('$reps reps')),
        Chip(label: Text('$sets sets'))
      ]),
      trailing: Checkbox(
        value: isComplete,
        onChanged: (value) => onCheckBoxChange(value),
      ),
    );
  }
}
