import 'package:flutter/material.dart';

import '../constants.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: List.generate(20, (index) {
            return AchievementItem(
              imagePath: 'assets/images/${index + 1}.png',
              title: 'Name achievements ${index + 1}',
            );
          }),
        ),
      ),
    );
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
