import 'package:flutter/material.dart';
import 'package:multi_providers/src/providers/setting_provider.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: context.watch<SettingProvider>().isDart ? Brightness.dark : Brightness.light),
      home: const HomeScreen(),
    );
  }
}
