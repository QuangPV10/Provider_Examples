import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/src/data/workout_data.dart';
import 'package:workout_tracker/src/screens/workout_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<WorkoutData>(context, listen: false).initalizeWorkoutList();
  }

  final workoutNameController = TextEditingController();

  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Workout'),
        content: TextField(
          controller: workoutNameController,
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
      ),
    );
  }

  void save() {
    final newWorkout = workoutNameController.text.toString();
    if (newWorkout.isEmpty) {
      return;
    }
    Provider.of<WorkoutData>(context, listen: false).addWorkout(workoutNameController.text.toString());
    Navigator.of(context).pop();
    workoutNameController.clear();
  }

  void cancel() {
    Navigator.of(context).pop();
    workoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Tracker'),
        centerTitle: true,
      ),
      body: Consumer<WorkoutData>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.workouts.length,
            itemBuilder: (context, index) {
              final workoutName = value.getWorkouts[index].name;
              return ListTile(
                  title: Text(workoutName),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WorkoutScreen(workoutName: workoutName),
                      ),
                    ),
                  ));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewWorkout,
        child: const Icon(Icons.add),
      ),
    );
  }
}
