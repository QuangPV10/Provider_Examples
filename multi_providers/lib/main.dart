import 'package:flutter/material.dart';
import 'package:multi_providers/src/providers/counter_provider.dart';
import 'package:multi_providers/src/providers/setting_provider.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CounterProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SettingProvider(),
      )
    ],
    child: const MyApp(),
  ));
}
