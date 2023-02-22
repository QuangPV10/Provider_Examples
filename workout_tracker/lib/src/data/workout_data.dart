import 'package:flutter/cupertino.dart';
import 'package:workout_tracker/src/data/hive_database.dart';
import 'package:workout_tracker/src/models/exercise.dart';
import 'package:workout_tracker/src/models/workout.dart';

class WorkoutData with ChangeNotifier {
  final db = HiveDatabas();

  List<Workout> workouts = [
    // default workouts
    Workout(exercises: [Exercise(name: 'Bicep Curls', reps: '10', sets: '3', weight: '10')], name: 'Upper Body'),
    Workout(exercises: [Exercise(name: 'Bicep Curls', reps: '10', sets: '3', weight: '10')], name: 'Lower Body')
  ];

  // get list workouts
  List<Workout> get getWorkouts => workouts;

  // get length of a given workout
  int getNumberOfExerciseInWorkout(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    return relevantWorkout.exercises.length;
  }

  // add new workout
  void addWorkout(String name) {
    workouts.add(Workout(exercises: [], name: name));
    notifyListeners();
    db.saveToDatabase(workouts);
  }

  // add an exercise to a workout
  void addExercise(String workoutName, Exercise exercise) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    relevantWorkout.exercises.add(exercise);
    notifyListeners();
    db.saveToDatabase(workouts);
  }

  // check off exercise
  void checkOffExercise(String workoutName, String exerciseName) {
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
    relevantExercise.isComplete = !relevantExercise.isComplete;
    notifyListeners();
    db.saveToDatabase(workouts);
  }

  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout = workouts.firstWhere((workout) => workout.name == workoutName);
    return relevantWorkout;
  }

  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    Exercise relevantExercise = relevantWorkout.exercises.firstWhere((exercise) => exercise.name == exerciseName);
    return relevantExercise;
  }

  void initalizeWorkoutList() {
    if (db.previousDataExist()) {
      workouts = db.readDataFromDatabase();
    } else {
      db.saveToDatabase(workouts);
    }
  }
}
