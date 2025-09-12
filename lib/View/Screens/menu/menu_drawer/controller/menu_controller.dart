import 'package:get/get.dart';

class MenuController extends GetxController {
  // Example navigation methods
  void goToHome() => Get.offNamed('/home');
  void goToAddWorks() => Get.toNamed('/addWorks');
  void goToAppExplain() => Get.toNamed('/appExplain');
  void goToTerms() => Get.toNamed('/terms');
  void goToAboutUs() => Get.toNamed('/aboutUs');
  void goToAppRating() => Get.toNamed('/appRating');
  void goToAppSharing() => Get.toNamed('/appSharing');
  void exitApp() => Get.back();
  // Contact actions
  void openContact(String type) {
    // Implement launch logic for social/contact icons
  }
}
