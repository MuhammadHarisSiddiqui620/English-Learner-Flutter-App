import 'package:english_learner_flutter_app/Screens/WordHeader.dart';
import 'package:english_learner_flutter_app/widgets/WordContainer.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/WordModel.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late Box<WordModel> box;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox<WordModel>('wordsBox'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final box = snapshot.data as Box<WordModel>;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              ...List.generate(box.length, (index) {
                final word = box.getAt(index);
                if (word == null) return SizedBox();

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WordHeader(word: word)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: WordContainer(), // ✅ Pass word to container
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
