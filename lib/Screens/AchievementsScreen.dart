import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/UserModel.dart';
import '../constants.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  late Box<UserModel> userBox;
  static List<String> achievementsName = [
    "Study the first word",
    "Add the word to favorites ",
    "Unlock the first parrot",
    "Level up",
    "Study 10 words ",
    "Add 10 words to favorites",
    "Increase level ",
    "Unlock some parrots",
    "Reach level 10",
    "Unlock all parrots",
  ];

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

        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // left & right padding
              child: Column(
                children: [
                  AchievementItem(
                    title: achievementsName[2],
                    imagePath: "assets/images/13.png",
                  ),
                  user.seenWords.isEmpty
                      ? AchievementItem(
                        title: achievementsName[0],
                        imagePath: "assets/images/1.png",
                      )
                      : AchievementItem(
                        title: achievementsName[0],
                        imagePath: "assets/images/11.png",
                      ),
                  user.favoritesWord.isEmpty
                      ? AchievementItem(
                        title: achievementsName[1],
                        imagePath: "assets/images/2.png",
                      )
                      : AchievementItem(
                        title: achievementsName[1],
                        imagePath: "assets/images/12.png",
                      ),
                  user.userLevel > 0
                      ? AchievementItem(
                        title: achievementsName[3],
                        imagePath: "assets/images/14.png",
                      )
                      : AchievementItem(
                        title: achievementsName[3],
                        imagePath: "assets/images/4.png",
                      ),
                  user.seenWords.length > 9
                      ? AchievementItem(
                        title: achievementsName[4],
                        imagePath: "assets/images/15.png",
                      )
                      : AchievementItem(
                        title: achievementsName[4],
                        imagePath: "assets/images/5.png",
                      ),
                  user.favoritesWord.length > 9
                      ? AchievementItem(
                        title: achievementsName[5],
                        imagePath: "assets/images/16.png",
                      )
                      : AchievementItem(
                        title: achievementsName[5],
                        imagePath: "assets/images/6.png",
                      ),
                  user.userLevel > 1
                      ? AchievementItem(
                        title: achievementsName[6],
                        imagePath: "assets/images/17.png",
                      )
                      : AchievementItem(
                        title: achievementsName[6],
                        imagePath: "assets/images/7.png",
                      ),
                  user.userLevel > 5
                      ? AchievementItem(
                        title: achievementsName[7],
                        imagePath: "assets/images/18.png",
                      )
                      : AchievementItem(
                        title: achievementsName[7],
                        imagePath: "assets/images/8.png",
                      ),
                  user.userLevel > 10
                      ? AchievementItem(
                        title: achievementsName[8],
                        imagePath: "assets/images/19.png",
                      )
                      : AchievementItem(
                        title: achievementsName[8],
                        imagePath: "assets/images/9.png",
                      ),
                  user.userLevel > 50
                      ? AchievementItem(
                        title: achievementsName[9],
                        imagePath: "assets/images/20.png",
                      )
                      : AchievementItem(
                        title: achievementsName[9],
                        imagePath: "assets/images/10.png",
                      ),
                ],
              ),
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

class AchievementItem extends StatelessWidget {
  final String imagePath;
  final String title;

  const AchievementItem({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            const SizedBox(width: 10),
            Text(title, style: parrotHeader),
          ],
        ),
      ),
    );
  }
}
