import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, this.maxLines = 1});
  String hintText;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: kprimarycolor),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          hintText: hintText,
        ),
      ),
    );
  }
}
