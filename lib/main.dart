import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Data/WordModel.dart';
import 'Screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(WordModelAdapter());

  await loadWordsIntoHive(); // Load and save from JSON to Hive

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
  final String jsonString = await rootBundle.loadString('assets/words.json');
  final List<dynamic> jsonList = json.decode(jsonString);

  final box = await Hive.openBox<WordModel>('wordsBox');

  for (var item in jsonList) {
    final word = WordModel.fromJson(item);
    await box.add(word);
  }
}
