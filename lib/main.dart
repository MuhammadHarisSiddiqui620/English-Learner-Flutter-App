import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Data/UserModel.dart';
import 'Data/WordModel.dart';
import 'Screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register Adapters
  Hive.registerAdapter(WordModelAdapter());
  Hive.registerAdapter(UserModelAdapter());

  // Open Hive Boxes
  await Hive.openBox('prefsBox'); // ✅ key-value box
  await Hive.openBox<UserModel>('userBox'); // ✅ user data
  await Hive.openBox<WordModel>('wordsBox'); // ✅ word data

  // Load words from JSON if empty
  await loadWordsIntoHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashScreen());
  }
}

Future<void> loadWordsIntoHive() async {
  final box = Hive.box<WordModel>('wordsBox');
  if (box.isEmpty) {
    final String jsonString = await rootBundle.loadString('assets/words.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    for (var item in jsonList) {
      final word = WordModel.fromJson(item);
      await box.add(word);
    }
  }
}
