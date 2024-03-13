import 'package:flutter/material.dart';

abstract class ThemeStyling {
  static const TextStyle welcomeTitle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "Roboto");

  static const TextStyle taskCardTitle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Roboto");

  static const TextStyle deleteAlert = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Roboto", color: Colors.red);

  static const TextStyle acceptAlert = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Roboto", color: Colors.green);
}