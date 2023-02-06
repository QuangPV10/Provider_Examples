import 'package:counter_provider/counter.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
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
              Text(context.watch<Counter>().getCounter.toString()),
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
                Navigator.of(context).pop();
              },
              child: const Text('Go to first screen'))
        ],
      ),
    );
  }
}
