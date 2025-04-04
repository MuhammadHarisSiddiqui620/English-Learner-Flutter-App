import 'package:english_learner_flutter_app/Screens/InitialOneTimeScreens/FourthScreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/CustomTextButton.dart';
import '../../widgets/CustomTextContainer.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/firstParrot.png'),
              const SizedBox(height: 20),
              CustomTextContainer(
                text:
                    "On the main screen you can see your stats, level and how many days in a row you are learning words, also at the bottom there is a navigation menu, navigate to the sections you need, also on the top right there is a parrot button, there you can choose another parrot.",
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/initialScreenImages02.png'),
                  Image.asset('assets/images/initialScreenImages03.png'),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/initialScreenImages04.png'),
                  Image.asset(
                    'assets/images/initialScreenImages05.png',
                    height: 120,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Image.asset(
                'assets/images/initialScreenImages06.png',
                height: 120,
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFFEFF1F5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 5,
                      ),
                      child: Text(
                        "Bring it back.",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  CustomTextButton(
                    text: "All right, next.",
                    screen: () => FourthScreen(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
