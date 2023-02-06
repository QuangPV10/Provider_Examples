import 'package:flutter/material.dart';
import 'package:multi_providers/src/providers/counter_provider.dart';
import 'package:multi_providers/src/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CounterProvider, SettingProvider>(
      builder: (context, counterProvider, settingProvider, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Multi Provider'),
            actions: [
              Switch(
                value: settingProvider.isDart,
                onChanged: (value) => settingProvider.setValue = value,
              )
            ],
          ),
          body: Center(
            child: Text(counterProvider.getCounter.toString()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterProvider.increase();
            },
            child: const Icon(Icons.add),
          )),
    );
  }
}
