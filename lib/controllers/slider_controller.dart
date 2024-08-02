import 'package:get/get.dart';

class SliderController extends GetxController {
  var currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
