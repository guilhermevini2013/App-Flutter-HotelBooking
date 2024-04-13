import 'package:flutter/cupertino.dart';

class WidgetsDecorated{
  static Text textDecorated(double size, String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}