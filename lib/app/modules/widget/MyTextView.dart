import 'package:flutter/material.dart';

class MyTextView extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;

  MyTextView({this.label = "", this.color = Colors.black54, this.fontSize = 0});

  @override
  Widget build(BuildContext context) {
    double fSize = fontSize;
    if (fSize == 0) {
      fSize = 14;
    }
    return Text(label, style: TextStyle(color: color, fontSize: fSize),);
  }
}