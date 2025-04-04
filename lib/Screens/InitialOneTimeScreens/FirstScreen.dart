import 'package:english_learner_flutter_app/Screens/InitialOneTimeScreens/SecondScreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/CustomTextButton.dart';
import '../../widgets/CustomTextContainer.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.center,
          // Center content horizontally
          children: [
            const Spacer(),
            Center(child: Image.asset('assets/images/firstParrot.png')),
            const SizedBox(height: 20),
            CustomTextContainer(
              text:
                  "Hi my friend, let me tell you in detail how to use this app.",
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomTextButton(
                    text: "Ok, Let's go!",
                    screen: () => SecondScreen(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
