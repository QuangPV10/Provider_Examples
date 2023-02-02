import 'package:counter_provider/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(create: (context) => Counter(), child: const HomeScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Row(
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
      ),
    );
  }
}
