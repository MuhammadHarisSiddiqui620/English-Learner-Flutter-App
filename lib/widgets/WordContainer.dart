import 'package:flutter/material.dart';

import '../constants.dart';

class WordContainer extends StatefulWidget {
  final int length;

  const WordContainer({super.key, required this.length});

  @override
  State<WordContainer> createState() => _WordContainerState();
}

class _WordContainerState extends State<WordContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFFF8F8F8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFB9FF37), width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${widget.length + 1}", style: dateStyle),
                        Text("Day", style: dayStyle),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text("\"Word ${widget.length + 1}\"", style: wordHeader),
                Text("- \"1, 2\"", style: wordDummy),
              ],
            ),
            Image.asset('assets/images/saveWord.png'),
          ],
        ),
      ),
    );
  }
}
