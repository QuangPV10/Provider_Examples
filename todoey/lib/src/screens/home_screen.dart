import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/src/models/task.dart';
import 'package:todoey/src/models/task_data.dart';
import 'package:todoey/src/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 30,
                  )),
              const SizedBox(height: 10),
              const Text(
                'Todoey',
                style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w500),
              ),
              Text(
                '${Provider.of<TaskData>(context).getLength} Tasks',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              )
            ]),
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  child: TaskList(
                    tasks: context.watch<TaskData>().getList,
                  )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            // hiển thị bottomSheet full screen
            // isScrollControlled: true,
            context: context,
            builder: (context) {
              return buildBottomSheet(context);
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 45,
        ),
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    TextEditingController contentController = TextEditingController();
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: contentController,
            autofocus: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.read<TaskData>().addTask(Task(content: contentController.text));
                contentController.clear();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add',
                textAlign: TextAlign.center,
              ))
        ]),
      ),
    );
  }
}
