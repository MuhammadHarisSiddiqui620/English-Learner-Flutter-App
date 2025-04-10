import 'package:english_learner_flutter_app/Screens/InitialOneTimeScreens/ThirdScreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/CustomTextButton.dart';
import '../../widgets/CustomTextContainer.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/firstParrot.png'),
                const SizedBox(height: 20),
                CustomTextContainer(
                  text:
                      "Every day you will be given a new word that you have to learn, tap on me to tell you more about this word, and add the word to “Saved”, there you can quickly find the word and repeat it.",
                ),
                SizedBox(height: 50),
                Image.asset('assets/images/initalScreens.png'),
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
                      screen: () => ThirdScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
