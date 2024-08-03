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

class Texts {
  static const String topLabel = 'SpaceX Launches';
  static const String bottomLabel = 'Missions';
  static const String emptyLaunches = "No missions available";

  static const String rocketsServiceException = 'Failed to load rockets';
  static const String missionsServiceException = 'Failed to load missions';
}

class Urls {
  static const String rocketsUrl = 'https://api.spacexdata.com/v3/rockets';
  static const String launchesUrl = 'https://api.spacexdata.com/v3/launches';
  static const String wikiBaseUrl = 'https://en.wikipedia.org/wiki/';
  static const String placeHolder = 'https://via.placeholder.com/150';
}
