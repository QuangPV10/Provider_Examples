import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';

void main() async {
  // init a hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox('my_database');

  runApp(const MyApp());
}
