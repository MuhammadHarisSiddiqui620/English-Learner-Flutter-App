import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/UserModel.dart';
import '../Data/WordModel.dart';
import '../constants.dart';

class WordContainer extends StatefulWidget {
  final int length;
  final WordModel? word;
  final bool favoriteScreen;

  const WordContainer({
    super.key,
    required this.length,
    required this.word,
    this.favoriteScreen = false,
  });

  @override
  State<WordContainer> createState() => _WordContainerState();
}

class _WordContainerState extends State<WordContainer> {
  late Box<UserModel> userBox;
  late UserModel currentUser;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    userBox = Hive.box<UserModel>('userBox');
    currentUser = userBox.getAt(0)!; // assuming the current user is at index 0
    isSaved = currentUser.favoritesWord.contains(widget.word);
  }

  void toggleFavorite() async {
    setState(() {
      isSaved = !isSaved;
    });

    if (isSaved) {
      currentUser.favoritesWord.add(widget.word!);
    } else {
      currentUser.favoritesWord.removeWhere((w) => w.word == widget.word!.word);
    }

    await currentUser.save(); // Save the change to Hive
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFFF8F8F8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.favoriteScreen)
              Image.asset('assets/images/quotes.png', height: 30, width: 40)
            else
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFB9FF37), width: 2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.length + 1}", style: dateStyle),
                          Text("Day", style: dayStyle),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Column(
              children: [
                Text("\"Word ${widget.length + 1}\"", style: wordHeader),
                Text("- \"1, 2\"", style: wordDummy),
              ],
            ),
            // Favorite toggle icon
            GestureDetector(
              onTap: () {
                setState(() {
                  toggleFavorite();
                });
              },
              child: Image.asset(
                isSaved
                    ? 'assets/images/saveWord.png'
                    : 'assets/images/unSaveWord.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
