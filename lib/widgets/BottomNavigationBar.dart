import 'package:english_learner_flutter_app/Screens/ParrotScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/WordModel.dart';
import '../Screens/AchievementsScreen.dart';
import '../Screens/DiaryScreen.dart';
import '../Screens/HomeScreen.dart';
import '../Screens/SavedScreen.dart'; // Adjust the import path if needed
import '../constants.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  final List<String> _appBarTitles = <String>[
    'Home',
    'Diary',
    'Saved',
    'Achievements',
  ];

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DiaryScreen(),
    SavedScreen(),
    AchievementsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _printWordsFromHive(); // Fetch and print Hive data
  }

  Future<void> _printWordsFromHive() async {
    final box = await Hive.openBox<WordModel>('wordsBox');
    for (int i = 0; i < box.length; i++) {
      final word = box.getAt(i);
      if (word != null) {
        /*        debugPrint(
          'Word: ${word.word}, Noun: ${word.noun}, Adjective: ${word.adjective}, Verb: ${word.verb}, Description: ${word.description}',
        );*/
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Text(_appBarTitles[_selectedIndex], style: newWord),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: GestureDetector(
              child: Image.asset('assets/images/top_bar_parrot.png'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParrotScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavItem(0, "assets/images/home_icon.png", "Home"),
          _buildNavItem(1, "assets/images/diary_icon.png", "Diary"),
          _buildNavItem(2, "assets/images/saved_icon.png", "Saved"),
          _buildNavItem(
            3,
            "assets/images/achievements_icon.png",
            "Achievements",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFF686464),
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF8F8F8),
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    int index,
    String iconPath,
    String label,
  ) {
    bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB9FF37) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageIcon(
              AssetImage(iconPath),
              color: isSelected ? Colors.black : const Color(0xFF686464),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : const Color(0xFF686464),
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
