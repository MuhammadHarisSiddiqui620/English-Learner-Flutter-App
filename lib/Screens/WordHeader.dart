import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/CustomTextButton.dart';
import 'InitialOneTimeScreens/SecondScreen.dart';

class WordHeader extends StatefulWidget {
  const WordHeader({super.key});

  @override
  State<WordHeader> createState() => _WordHeaderState();
}

class _WordHeaderState extends State<WordHeader> {
  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFE5),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        17,
                        0,
                        0,
                        0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Center(child: Text("DAY 23", style: wordHeader)),
                          const SizedBox(height: 40),
                          Center(
                            child: Text(
                              "Your new word of the day is",
                              style: newWord,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Image.asset(
                              'assets/images/quotes.png',
                              height: 46,
                              width: 57,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(child: Text("Cannole", style: wordHeader)),
                          const SizedBox(height: 40),

                          // ✅ Show only when showText is true
                          if (showText)
                            Container(
                              margin: const EdgeInsets.only(right: 17),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(0x7EBBCBF3),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Tap me so I can tell you\n more about that word.",
                                style: wordDummy,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 🟢 Green Parrot Tap
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showText = !showText;
                        debugPrint("showText= ${showText}");
                      });
                    },
                    child: Image.asset('assets/images/greenParrot.png'),
                  ),
                ),

                // ✅ Button shown only when showText is true
                if (showText)
                  Positioned(
                    bottom: 20,
                    left: 48,
                    right: 48,
                    child: CustomTextButton(
                      text: "Ok",
                      screen: () => SecondScreen(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
