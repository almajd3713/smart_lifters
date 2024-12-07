

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box prefs;

Future<void> init_prefs() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  prefs = await Hive.openBox('PREFS_DB');
}