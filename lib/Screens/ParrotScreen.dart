import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Data/UserModel.dart';
import '../constants.dart';

class ParrotScreen extends StatefulWidget {
  const ParrotScreen({super.key});

  @override
  State<ParrotScreen> createState() => _ParrotScreenState();
}

class _ParrotScreenState extends State<ParrotScreen> {
  late Box<UserModel> userBox;
  late UserModel currentUser;

  @override
  void initState() {
    super.initState();
    userBox = Hive.box<UserModel>('userBox');
    currentUser = userBox.getAt(0)!; // assuming the current user is at index 0
  }

  void saveNewParrot(String newParrot) async {
    currentUser.selectedParrot = newParrot;
    await currentUser.save();
  }

  Widget buildParrotItem({
    required String imagePath,
    required String name,
    required String description,
    required bool isEquipped,
    required bool isUnlocked,
  }) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap:
                  isUnlocked
                      ? () {
                        setState(() {
                          saveNewParrot(imagePath);
                        });
                        debugPrint('$name Clicked');
                      }
                      : null,
              child: Opacity(
                opacity: isUnlocked ? 1.0 : 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(imagePath, height: 50, width: 50),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(name, style: parrotHeader),
                                  Text(description, style: parrotSubheader),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: -60,
                            right: 0,
                            child: Container(
                              width: 315,
                              height: 60,
                              decoration: BoxDecoration(
                                color:
                                    isEquipped
                                        ? const Color(0xFFB9FF37)
                                        : const Color(0xFFD2D2D2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  isUnlocked
                                      ? (isEquipped
                                          ? "Equipped"
                                          : "Tap to Equip")
                                      : "Locked",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  int _requiredLevelForParrot(String imagePath) {
    List<String> parrotImages = [
      'assets/images/greenParrot.png',
      'assets/images/lightGreenParrot.png',
      'assets/images/pinkParrot.png',
      'assets/images/blueParrot.png',
      'assets/images/purpleParrot.png',
    ];
    int index = parrotImages.indexOf(imagePath);
    return index * 10;
  }

  bool _isParrotUnlocked(String imagePath) {
    int requiredLevel = _requiredLevelForParrot(imagePath);
    return currentUser.userLevel >= requiredLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parrots", style: newWord),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFE1FD0F),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset('assets/images/top_bar_parrot.png'),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                buildParrotItem(
                  imagePath: 'assets/images/greenParrot.png',
                  name: 'Name parrots 1',
                  description: 'Desc parrots 1',
                  isEquipped:
                      currentUser.selectedParrot ==
                      'assets/images/greenParrot.png',
                  isUnlocked: _isParrotUnlocked(
                    'assets/images/greenParrot.png',
                  ),
                ),
                buildParrotItem(
                  imagePath: 'assets/images/lightGreenParrot.png',
                  name: 'Name parrots 2',
                  description: 'Desc parrots 2',
                  isEquipped:
                      currentUser.selectedParrot ==
                      'assets/images/lightGreenParrot.png',
                  isUnlocked: _isParrotUnlocked(
                    'assets/images/lightGreenParrot.png',
                  ),
                ),
                buildParrotItem(
                  imagePath: 'assets/images/pinkParrot.png',
                  name: 'Name parrots 3',
                  description: 'Desc parrots 3',
                  isEquipped:
                      currentUser.selectedParrot ==
                      'assets/images/pinkParrot.png',
                  isUnlocked: _isParrotUnlocked('assets/images/pinkParrot.png'),
                ),
                buildParrotItem(
                  imagePath: 'assets/images/blueParrot.png',
                  name: 'Name parrots 4',
                  description: 'Desc parrots 4',
                  isEquipped:
                      currentUser.selectedParrot ==
                      'assets/images/blueParrot.png',
                  isUnlocked: _isParrotUnlocked('assets/images/blueParrot.png'),
                ),
                buildParrotItem(
                  imagePath: 'assets/images/purpleParrot.png',
                  name: 'Name parrots 5',
                  description: 'Desc parrots 5',
                  isEquipped:
                      currentUser.selectedParrot ==
                      'assets/images/purpleParrot.png',
                  isUnlocked: _isParrotUnlocked(
                    'assets/images/purpleParrot.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
