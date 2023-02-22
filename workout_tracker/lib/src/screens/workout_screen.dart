import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/src/data/workout_data.dart';
import 'package:workout_tracker/src/models/exercise.dart';
import 'package:workout_tracker/src/widgets/exercise_title.dart';

class WorkoutScreen extends StatelessWidget {
  final String workoutName;
  const WorkoutScreen({required this.workoutName, super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseController = TextEditingController();
    final repsController = TextEditingController();
    final weightController = TextEditingController();
    final setsController = TextEditingController();
    void save() {
      final newWorkout = exerciseController.text.toString();
      if (newWorkout.isEmpty) {
        return;
      }
      final exercise = Exercise(
          name: exerciseController.text,
          reps: repsController.text,
          sets: setsController.text,
          weight: weightController.text);
      Provider.of<WorkoutData>(context, listen: false).addExercise(workoutName, exercise);
      Navigator.of(context).pop();
      exerciseController.clear();
      setsController.clear();
      weightController.clear();
      repsController.clear();
    }

    void cancel() {
      Navigator.of(context).pop();
      exerciseController.clear();
    }

    void createNewExercise() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Create New Exercise'),
            content: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Name'),
                    controller: exerciseController,
                  ),
                  TextField(
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Weight'),
                    controller: weightController,
                  ),
                  TextField(
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Set'),
                    controller: setsController,
                  ),
                  TextField(
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Rep'),
                    controller: repsController,
                  ),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: save,
                child: const Text('Save'),
              ),
              MaterialButton(
                onPressed: cancel,
                child: const Text('Cancel'),
              )
            ],
          );
        },
      );
    }

    return Consumer<WorkoutData>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(workoutName),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: value.getNumberOfExerciseInWorkout(workoutName),
            itemBuilder: (context, index) {
              final exercise = value.getRelevantWorkout(workoutName).exercises[index];
              return ExerciseTitle(
                onCheckBoxChange: (value) =>
                    Provider.of<WorkoutData>(context, listen: false).checkOffExercise(workoutName, exercise.name),
                exerciseName: exercise.name,
                isComplete: exercise.isComplete,
                reps: exercise.reps,
                sets: exercise.sets,
                weight: exercise.weight,
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: createNewExercise,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
