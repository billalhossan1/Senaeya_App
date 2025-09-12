import 'package:Senaeya/Core/AppRoute/app_route.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  RxDouble animation = 0.0.obs;
  RxDouble animation2 = 0.0.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 500), () {
      animation.value = 1.0;
      animation2.value = 1.0;
    });
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoute.loginScreen);
    });
    super.onInit();
  }
}