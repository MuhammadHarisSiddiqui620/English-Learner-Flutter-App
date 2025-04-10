import 'dart:async';

import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';

import 'BottomNavigationBar.dart';
import 'InitialOneTimeScreens/FirstScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    bool firstRun = await IsFirstRun.isFirstRun();
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      // Check if the widget is still in the tree
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  firstRun
                      ? const FirstScreen()
                      : const BottomNavigationBarExample(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/splashscreen.png')),
    );
  }
}
