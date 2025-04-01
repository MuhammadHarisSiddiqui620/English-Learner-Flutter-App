import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;

  const CustomTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFB9FF37)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          "Ok, Let's go!",
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
