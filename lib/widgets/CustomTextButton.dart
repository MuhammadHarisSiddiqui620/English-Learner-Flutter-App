import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Widget Function() screen;

  const CustomTextButton({super.key, required this.text, required this.screen});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen()),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFB9FF37)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
