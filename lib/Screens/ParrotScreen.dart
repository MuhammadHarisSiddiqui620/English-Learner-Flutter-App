import 'package:flutter/material.dart';

import '../constants.dart';

class ParrotScreen extends StatefulWidget {
  const ParrotScreen({super.key});

  @override
  State<ParrotScreen> createState() => _ParrotScreenState();
}

class _ParrotScreenState extends State<ParrotScreen> {
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
                color: Color(0xFFE1FD0F),
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
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/greenParrot.png',
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name parrots 1", style: parrotHeader),
                                Text("Desc parrots 1", style: parrotSubheader),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -60, // pushes it downward
                          right: 0, // you can tweak this based on layout
                          child: SizedBox(
                            width: 315,
                            height: 60,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFB9FF37),
                                ),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  "Equipped",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/lightGreenParrot.png',
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name parrots 2", style: parrotHeader),
                                Text("Desc parrots 2", style: parrotSubheader),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -60, // pushes it downward
                          right: 0, // you can tweak this based on layout
                          child: SizedBox(
                            width: 315,
                            height: 60,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFD2D2D2),
                                ),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  "Locked",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/pinkParrot.png',
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name parrots 3", style: parrotHeader),
                                Text("Desc parrots 3", style: parrotSubheader),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -60, // pushes it downward
                          right: 0, // you can tweak this based on layout
                          child: SizedBox(
                            width: 315,
                            height: 60,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFD2D2D2),
                                ),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  "Locked",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/blueParrot.png',
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name parrots 4", style: parrotHeader),
                                Text("Desc parrots 4", style: parrotSubheader),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -60, // pushes it downward
                          right: 0, // you can tweak this based on layout
                          child: SizedBox(
                            width: 315,
                            height: 60,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFD2D2D2),
                                ),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  "Locked",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/purpleParrot.png',
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name parrots 5", style: parrotHeader),
                                Text("Desc parrots 5", style: parrotSubheader),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -60, // pushes it downward
                          right: 0, // you can tweak this based on layout
                          child: SizedBox(
                            width: 315,
                            height: 60,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFD2D2D2),
                                ),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  "Locked",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
