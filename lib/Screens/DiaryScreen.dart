import 'package:english_learner_flutter_app/Screens/WordHeader.dart';
import 'package:english_learner_flutter_app/widgets/WordContainer.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WordHeader()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: WordContainer(),
            ),
          ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("1", style: dateStyle),
                                Text("Day", style: dayStyle),
                              ],
                            ),
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
  }
}
