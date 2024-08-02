import 'package:get/get.dart';

class SliderController extends GetxController {
  var currentIndex = 0.obs;

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

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
