import 'package:english_learner_flutter_app/Data/WordModel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/UserModel.dart';
import '../constants.dart';

class WordHeader extends StatefulWidget {
  final WordModel? word;

  const WordHeader({super.key, required this.word});

  @override
  State<WordHeader> createState() => _WordHeaderState();
}

class _WordHeaderState extends State<WordHeader> {
  late Box<UserModel> userBox;
  final ValueNotifier<bool> showText = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([Hive.openBox<UserModel>('userBox')]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        userBox = Hive.box<UserModel>('userBox');
        UserModel user = _getOrCreateUser();

        return Scaffold(
          backgroundColor: const Color(0xFFF5FFE5),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            17,
                            0,
                            0,
                            0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 40),
                              Center(
                                child: Text(
                                  "DAY ${user.showWords.length}",
                                  style: wordHeader,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Center(
                                child: Text(
                                  "Your new word of the day is",
                                  style: newWord,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Image.asset(
                                  'assets/images/quotes.png',
                                  height: 46,
                                  width: 57,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: Text(
                                  "\"${widget.word?.word}\"",
                                  style: wordHeader,
                                ),
                              ),

                              /// ✅ Only this part rebuilds
                              ValueListenableBuilder<bool>(
                                valueListenable: showText,
                                builder: (context, value, _) {
                                  return Column(
                                    children: [
                                      value
                                          ? const SizedBox(height: 8)
                                          : const SizedBox(height: 40),
                                      if (value)
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              "\"${widget.word!.noun.isNotEmpty
                                                  ? widget.word?.noun
                                                  : widget.word!.adjective.isNotEmpty
                                                  ? widget.word?.adjective
                                                  : widget.word!.verb.isNotEmpty
                                                  ? widget.word?.verb
                                                  : ''}\"",
                                              style: wordNoun,
                                            ),
                                          ),
                                        ),
                                      value
                                          ? Container(
                                            height: 158,
                                            margin: const EdgeInsets.only(
                                              right: 17,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: Colors.transparent,
                                            ),
                                            padding: const EdgeInsets.all(20.0),
                                            child: SingleChildScrollView(
                                              child: Text(
                                                "${widget.word!.description.isNotEmpty ? widget.word?.description : ''}",
                                                style: dayStyle,
                                              ),
                                            ),
                                          )
                                          : Container(
                                            margin: const EdgeInsets.only(
                                              right: 17,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: const Color(0x7EBBCBF3),
                                            ),
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              "Tap me so I can tell you\n more about that word.",
                                              style: wordDummy,
                                            ),
                                          ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// ✅ Parrot Image with tap
                    ValueListenableBuilder<bool>(
                      valueListenable: showText,
                      builder: (context, value, _) {
                        return Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () async {
                              if (!value) {
                                showText.value = true;

                                user.seenWords = user.seenWords;
                                if (widget.word != null &&
                                    !user.seenWords.contains(widget.word)) {
                                  user.seenWords.add(widget.word!);
                                  await user.save();
                                }

                                bool hasSeenFav = user.seenWords.any(
                                  (seenWord) =>
                                      user.favoritesWord.contains(seenWord),
                                );

                                if (user.seenWords.length % 3 == 0 &&
                                    hasSeenFav) {
                                  user.userLevel += 1;
                                  await user.save();
                                  debugPrint(
                                    "Level up! New level: ${user.userLevel}",
                                  );
                                }

                                debugPrint(
                                  "Seen words count: ${user.seenWords.length}",
                                );
                                debugPrint("User level: ${user.userLevel}");
                              } else {
                                showText.value = false;
                              }

                              debugPrint("showText= ${showText.value}");
                            },
                            child: Image.asset(
                              user.selectedParrot,
                              height: value ? 330 : null,
                            ),
                          ),
                        );
                      },
                    ),

                    /// ✅ OK Button (only shown when showText is true)
                    ValueListenableBuilder<bool>(
                      valueListenable: showText,
                      builder: (context, value, _) {
                        if (!value) return const SizedBox();
                        return Positioned(
                          bottom: 20,
                          left: 48,
                          right: 48,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xFFB9FF37),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 5,
                              ),
                              child: Text(
                                "Ok",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
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
