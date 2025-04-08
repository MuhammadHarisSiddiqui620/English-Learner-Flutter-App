import 'package:english_learner_flutter_app/Screens/WordHeader.dart';
import 'package:english_learner_flutter_app/widgets/WordContainer.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/UserModel.dart';
import '../Data/WordModel.dart';
import '../constants.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
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
        final prefsBox = Hive.box('prefsBox');
        final now = DateTime.now();

        if (user.seenWords.isEmpty && wordBox.isNotEmpty) {
          user.seenWords.add(wordBox.getAt(0)!);
          user.save();
          prefsBox.put('lastSeenUpdate', now);
        }

        lastSeenUpdate = prefsBox.get('lastSeenUpdate');
        final hoursPassed =
            lastSeenUpdate == null
                ? 25
                : now.difference(lastSeenUpdate!).inHours;

        if (hoursPassed >= 24 && user.seenWords.length < wordBox.length) {
          final nextWord = wordBox.getAt(user.seenWords.length);
          if (nextWord != null) {
            user.seenWords.add(nextWord);
            user.save();
            prefsBox.put('lastSeenUpdate', now);
          }
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              ...List.generate(user.seenWords.length, (index) {
                final word = user.seenWords[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WordHeader(word: word)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: WordContainer(length: index),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFFF5FFE5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFB9FF37),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${user.seenWords.length + 1}",
                                    style: dateStyle,
                                  ),
                                  Text("Day", style: dayStyle),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text("New word", style: wordHeader),
                            Text("Tomorrow.", style: wordDummy),
                          ],
                        ),
                        Image.asset('assets/images/saveWord.png'),
                      ],
                    ),
                  ),
                ),
              ),
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
