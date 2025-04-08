import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/UserModel.dart';
import '../Data/WordModel.dart';
import '../widgets/WordContainer.dart';
import 'WordHeader.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late Box<UserModel> userBox;
  late Box<WordModel> wordBox;
  DateTime? lastSeenUpdate;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        Hive.openBox<UserModel>('userBox'),
        Hive.openBox<WordModel>('wordsBox'),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        userBox = Hive.box<UserModel>('userBox');
        wordBox = Hive.box<WordModel>('wordsBox');

        UserModel user = _getOrCreateUser();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              ...List.generate(user.favoritesWord.length, (index) {
                final word = user.favoritesWord[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WordHeader(word: word)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: WordContainer(
                      length: index,
                      word: word,
                      favoriteScreen: true,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  UserModel _getOrCreateUser() {
    if (userBox.isEmpty) {
      final newUser = UserModel();
      userBox.add(newUser);
      return newUser;
    }
    return userBox.getAt(0)!;
  }
}
