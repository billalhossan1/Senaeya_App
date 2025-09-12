import 'package:get/get.dart';

class NavigationController extends GetxController {
  // 0: Home, 1: Settings, others can be added
  var selectedIndex = 0.obs;

  void changeScreen(int index) {
    selectedIndex.value = index;
  }
}

