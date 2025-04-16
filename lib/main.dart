import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // 👉 Track app open BEFORE running the app
  await trackAppOpen();

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

Future<void> trackAppOpen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  const dayMap = {
    DateTime.monday: "Mo",
    DateTime.tuesday: "Tu",
    DateTime.wednesday: "We",
    DateTime.thursday: "Th",
    DateTime.friday: "Fr",
    DateTime.saturday: "Sa",
    DateTime.sunday: "Su",
  };

  String currentDay = dayMap[DateTime.now().weekday]!;

  List<String> openedDays = prefs.getStringList('opened_days') ?? [];

  if (!openedDays.contains(currentDay)) {
    openedDays.add(currentDay);
    await prefs.setStringList('opened_days', openedDays);

    var userBox = await Hive.openBox<UserModel>('userBox');
    UserModel user;

    if (userBox.isEmpty) {
      user = UserModel();
      await userBox.add(user); // Add user to the box first
    } else {
      user = userBox.getAt(0)!;
    }

    if (!user.studyDays.contains(currentDay)) {
      user.studyDays.add(currentDay);
      await user.save();
    }
  }

  print('App has been opened on these days: $openedDays');
}
