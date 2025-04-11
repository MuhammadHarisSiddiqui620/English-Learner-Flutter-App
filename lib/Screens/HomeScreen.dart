import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/UserModel.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<UserModel> userBox;

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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Saved Words", style: homeScreenHeaders),
                    SizedBox(height: 20),
                    Container(
                      color: Color(0xFFFFFEE5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/savedWordsIcon.png'),
                            Text("Your saved words", style: homeScreenWord),
                            Text(
                              "${user.favoritesWord.length}",
                              style: dateStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text("Statistics:", style: homeScreenHeaders),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 246,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFB9FF37),
                            boxShadow: [BoxShadow(color: Colors.green)],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 16,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("5", style: levelInteger),
                                Text("Your \n level", style: levelText),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Words studied:", style: homeScreenWord),
                                Text(
                                  "Total days in the app:",
                                  style: homeScreenWord,
                                ),
                                Text(
                                  "Achievements received:",
                                  style: homeScreenWord,
                                ),
                                Text(
                                  "Words to the next level:",
                                  style: homeScreenWord,
                                ),
                                Text("Favorite Words:", style: homeScreenWord),
                                Text(
                                  "Parrots discovered:",
                                  style: homeScreenWord,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  "${user.seenWords.length}",
                                  style: dateStyle,
                                ),
                                SizedBox(height: 7),
                                Text("data", style: dateStyle),
                                SizedBox(height: 7),
                                Text("data", style: dateStyle),
                                SizedBox(height: 7),
                                Text(
                                  "${user.favoritesWord.length}",
                                  style: dateStyle,
                                ),
                                SizedBox(height: 7),
                                Text("data", style: dateStyle),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Text("Study days:", style: homeScreenHeaders),
                  ],
                ),
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
