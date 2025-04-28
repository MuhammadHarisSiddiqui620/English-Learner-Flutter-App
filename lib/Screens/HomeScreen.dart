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
  final List<String> allDays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    user.userLevel.toString(),
                                    style: levelInteger,
                                  ),
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
                                  SizedBox(height: 15),
                                  Text(
                                    "Total days in the app:",
                                    style: homeScreenWord,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Achievements received:",
                                    style: homeScreenWord,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Words to the next level:",
                                    style: homeScreenWord,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Favorite Words:",
                                    style: homeScreenWord,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Parrots discovered:",
                                    style: homeScreenWord,
                                  ),
                                ],
                              ),
                              SizedBox(width: 60),
                              Column(
                                children: [
                                  Text(
                                    "${user.seenWords.length}",
                                    style: dateStyle,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    user.showWords.length.toString(),
                                    style: dateStyle,
                                  ),
                                  SizedBox(height: 15),
                                  Text("2", style: dateStyle),
                                  SizedBox(height: 15),
                                  Text(
                                    user.seenWords.length - 3 >= 0
                                        ? (user.seenWords.length - 3).toString()
                                        : "3",
                                    style: dateStyle,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "${user.favoritesWord.length}",
                                    style: dateStyle,
                                  ),
                                  SizedBox(height: 15),
                                  Text("1", style: dateStyle),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Text("Study days:", style: homeScreenHeaders),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          allDays.map((day) {
                            bool isStudied = user.studyDays.contains(day);
                            int currentIndex = allDays.indexOf(
                              _getCurrentDay(),
                            );
                            int dayIndex = allDays.indexOf(day);

                            String imagePath;
                            if (isStudied) {
                              imagePath = 'assets/images/OpenedDay.png';
                            } else if (dayIndex <= currentIndex) {
                              imagePath = 'assets/images/NotOpenedDay.png';
                            } else {
                              imagePath = 'assets/images/inActiveDay.png';
                            }

                            return Column(
                              children: [
                                Image.asset(imagePath),
                                const SizedBox(height: 5),
                                Text(day, style: daysStyle),
                              ],
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        // Makes the row just wide enough for its content
                        children: [
                          Image.asset(
                            'assets/images/calendor.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            user.studyDays.length.toString(),
                            style: activeDaysCount,
                          ),
                          SizedBox(width: 8),
                          Text("Active day", style: daysStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _getCurrentDay() {
    final now = DateTime.now();
    const dayMap = {
      DateTime.monday: "Mo",
      DateTime.tuesday: "Tu",
      DateTime.wednesday: "We",
      DateTime.thursday: "Th",
      DateTime.friday: "Fr",
      DateTime.saturday: "Sa",
      DateTime.sunday: "Su",
    };
    return dayMap[now.weekday]!;
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
