import 'package:get/get.dart';

class SliderController extends GetxController {
  var currentIndex = 0.obs;

  final List<String> images = [
    'assets/images/rocket1.jpg',
    'assets/images/rocket2.jpg',
    'assets/images/rocket3.jpg',
    'assets/images/rocket4.jpg',
  ];

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
