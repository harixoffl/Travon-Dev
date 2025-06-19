import 'package:flutter/material.dart';

const kwhite = Color.fromARGB(255, 255, 255, 255);
const kPrimaryColor = Color(0xFF6F35A5);

const kPrimaryLightColor = Color(0xFFF1E6FF);

const kblack = Colors.black;
dynamic kgrey = Colors.grey[300];
const double defaultPadding = 16.0;
const profilename = "";

class Primary_colors {
  static const Color Light = Color.fromARGB(255, 11, 15, 26);
  static const Color Dark = Color.fromARGB(255, 18, 22, 33);
  static const Color Color1 = Colors.white;
  static const Color Color2 = Colors.black;
  static const Color Color3 = Color.fromARGB(255, 100, 111, 255);
  // static const Color Color3 = Color.fromARGB(255, 100, 111, 255);
  static const Color Color4 = Color.fromARGB(255, 255, 169, 150);
  static const Color Color5 = Color.fromARGB(255, 225, 174, 240);
  static const Color Color6 = Color.fromARGB(255, 255, 217, 120);
  static const Color Color7 = Color.fromARGB(255, 133, 131, 131);
  static const Color Color8 = Color.fromARGB(255, 131, 195, 247);
  static const Color Color9 = Color.fromARGB(255, 213, 212, 212);
}

class Primary_font_size {
  static const double Text1 = 6.0;
  static const double Text2 = 7.0;
  static const double Text3 = 8.0;
  static const double Text4 = 9.0;
  static const double Text5 = 10.0;
  static const double Text6 = 11.0;
  static const double Text7 = 12.0;
  static const double Text8 = 13.0;
  static const double Text9 = 14.0;
  static const double Text10 = 15.0;
  static const double Text11 = 16.0;
  static const double Text12 = 17.0;
  static const double Text13 = 18.0;
  static const double Text14 = 19.0;
  static const double Text15 = 20.0;
  static const double SubHeading = 17.0;
  static const double Heading = 22.0;
}

final List<LinearGradient> packageGradients = [
  LinearGradient(
    colors: [
      const Color(0xFF00FFC6).withOpacity(0.9), // Bright teal-green
      const Color(0xFF00FFD1).withOpacity(0.1),
    ],
  ),
  LinearGradient(
    colors: [
      const Color(0xFFFF5F6D).withOpacity(0.9), // Bright coral-red
      const Color(0xFFFFC371).withOpacity(0.1),
    ],
  ),
  LinearGradient(
    colors: [
      const Color.fromARGB(255, 111, 255, 145).withOpacity(0.9), // Pink gradient
      const Color.fromARGB(255, 26, 199, 133).withOpacity(0.1),
    ],
  ),
  LinearGradient(
    colors: [
      const Color(0xFF00C9FF).withOpacity(0.9), // Cyan to light blue
      const Color(0xFF92FE9D).withOpacity(0.1),
    ],
  ),
  LinearGradient(
    colors: [
      const Color(0xFFFFD200).withOpacity(0.9), // Bright yellow gold
      const Color(0xFFFFA500).withOpacity(0.1),
    ],
  ),
  LinearGradient(
    colors: [
      const Color.fromARGB(255, 192, 129, 255).withOpacity(0.9), // Bright violet
      const Color(0xFFE100FF).withOpacity(0.1),
    ],
  ),
];
