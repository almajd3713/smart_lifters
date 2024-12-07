

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_lifters/src/db/schemas/post/post.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

late Box localData;

Future<void> initPrefs() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await openBoxes();
}

Future<void> openBoxes() async {
  Hive.registerAdapter(PostAdapter());
  Hive.registerAdapter(UserAdapter());
  localData = await Hive.openBox('POST_DB');

  await checkFirstLaunch();
}

Future<void> checkFirstLaunch() async {
  await localData.clear();
  localData.put('is_first_launch', true);
  bool? isFirstLaunch = localData.get('is_first_launch');
  if(isFirstLaunch == null || isFirstLaunch || true) {
    // await localData.put('is_first_launch', false);
    await localData.put('user', User());
  }
}