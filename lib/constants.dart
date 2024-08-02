import 'package:flutter/material.dart';

class Clrs {
  static const Color cBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color cDarkGrey = Color.fromARGB(255, 28, 28, 28);
  static const Color cLightGreen = Color.fromARGB(255, 186, 252, 84);
  static const Color cLightGrey = Color.fromARGB(255, 197, 197, 197);
  static const Color cWhite = Color.fromARGB(255, 255, 255, 255);
}

class FontWeights {
  static const FontWeight mediumFW = FontWeight.w500;
  static const FontWeight lightFW = FontWeight.w400;
}

class DataLists {
  final List<String> images = [
    'assets/images/rocket1.jpg',
    'assets/images/rocket2.jpg',
    'assets/images/rocket3.jpg',
    'assets/images/rocket4.jpg',
  ];

  final List<Map<String, String>> missions = [
    {
      'date': '10/06/2023',
      'time': '06:34 PM',
      'name': 'Starlink Group 2-10',
      'location': 'Kwajalein Atoll Omelek Island',
    },
    {
      'date': '11/06/2023',
      'time': '06:34 PM',
      'name': 'CRS2 SpX-28 (Dragon)',
      'location': 'Kwajalein Atoll Omelek Island',
    },
    {
      'date': '12/02/2023',
      'time': '06:34 PM',
      'name': 'CRS2 SpX-28 (Dragon)',
      'location': 'Kwajalein Atoll Omelek Island',
    },
    {
      'date': '15/02/2023',
      'time': '06:34 PM',
      'name': 'CRS2 SpX-28 (Dragon)',
      'location': 'Kwajalein Atoll Omelek Island',
    },
    {
      'date': '13/02/2023',
      'time': '06:34 PM',
      'name': 'CRS2 SpX-28 (Dragon)',
      'location': 'Kwajalein Atoll Omelek Island',
    },
  ];
}
