import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;

  const CustomTextContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0x7EA4BBF4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'OpenSans-Medium',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
