import 'package:counter_provider/counter.dart';
import 'package:counter_provider/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () {
                    context.read<Counter>().decrementCounter();
                  },
                  child: const Icon(CupertinoIcons.minus)),
              Text('${context.watch<Counter>().getCounter}'),
              // Text(Provider.of<Counter>(context).getCounter.toString()),
              OutlinedButton(
                  onPressed: () {
                    context.read<Counter>().incrementCounter();
                  },
                  child: const Icon(Icons.add))
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ));
              },
              child: const Text('Go to second screen'))
        ],
      ),
    );
  }
}
