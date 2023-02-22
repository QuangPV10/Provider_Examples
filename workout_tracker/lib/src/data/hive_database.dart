import 'package:hive/hive.dart';
import 'package:workout_tracker/src/datetime/date_time.dart';
import 'package:workout_tracker/src/models/exercise.dart';

import '../models/workout.dart';

class HiveDatabas {
  // reference hive box
  final _myBox = Hive.box('my_database');

  // check if there is already data stored, if not, record the start date
  bool previousDataExist() {
    if (_myBox.isEmpty) {
      _myBox.put("START_DATE", todayDateYYYYMMDD());
      return false;
    } else {
      return true;
    }
  }

  // return start date as yyyymmdd
  String getStartDate() {
    return _myBox.get("START_DATE");
  }

  // write data
  void saveToDatabase(List<Workout> workouts) {
    final workoutList = convertObjectToWorkoutList(workouts);
    final exerciseList = convertObjectToExerciseList(workouts);

    if (exerciseCompleted(workouts)) {
      _myBox.put("COMPLETION_STATUS_${todayDateYYYYMMDD()}", 1);
    } else {
      _myBox.put("COMPLETION_STATUS_${todayDateYYYYMMDD()}", 0);
    }

    _myBox.put("WORKOUTS", workoutList);
    _myBox.put("EXERCISES", exerciseList);
  }

  // read data
  List<Workout> readDataFromDatabase() {
    List<Workout> mySavedWorkout = [];
    List<String> workoutNames = _myBox.get("WORKOUTS");
    final exerciseDetails = _myBox.get("EXERCISES");

    for (int i = 0; i < workoutNames.length; i++) {
      List<Exercise> exercisesInWorkout = [];
      for (int j = 0; j < exerciseDetails[i]; j++) {
        exercisesInWorkout.add(Exercise(
            name: exerciseDetails[i][j][0],
            reps: exerciseDetails[i][j][1],
            sets: exerciseDetails[i][j][2],
            weight: exerciseDetails[i][j][3],
            isComplete: exerciseDetails[i][j][4] == "true" ? true : false));
      }

      Workout workout = Workout(exercises: exercisesInWorkout, name: workoutNames[i]);
      mySavedWorkout.add(workout);
    }

    return mySavedWorkout;
  }

  // check if any exercise have been done
  bool exerciseCompleted(List<Workout> workouts) {
    for (var workout in workouts) {
      for (var exercse in workout.exercises) {
        if (exercse.isComplete) return true;
      }
    }
    return false;
  }

  // return completion status of a given data yyyymmdd
  int getCompletionStatus(String yyyymmdd) {
    int completionStatus = _myBox.get("COMPLETION_STATUS_$yyyymmdd") ?? 0;
    return completionStatus;
  }

  // converts workout objest to list
  List<String> convertObjectToWorkoutList(List<Workout> workouts) {
    List<String> workoutList = workouts.map((woorkout) => woorkout.name).toList();

    return workoutList;
  }

  // converts the exercise in a workout object in to a list string
  List<List<List<String>>> convertObjectToExerciseList(List<Workout> workouts) {
    List<List<List<String>>> exerciseList = [];

    // go through each workout
    for (int i = 0; i < workouts.length; i++) {
      List<Exercise> exerciseInWorkout = workouts[i].exercises;

      List<List<String>> individualWorkout = [];

      // go through each exercise in exerciseList
      for (int j = 0; j < exerciseInWorkout.length; j++) {
        List<String> individualExercise = [];
        individualExercise.addAll([
          exerciseInWorkout[j].name,
          exerciseInWorkout[j].weight,
          exerciseInWorkout[j].reps,
          exerciseInWorkout[j].sets,
          exerciseInWorkout[j].isComplete.toString()
        ]);

        individualWorkout.add(individualExercise);
      }
      exerciseList.add(individualWorkout);
    }
    return exerciseList;
  }
}
