import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController controller = Get.find<SplashScreenController>();
    return Scaffold(
      backgroundColor: const Color(0xff1771B7),
      body: Obx(
        () => Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: controller.animation2.value,
            child: AnimatedScale(
              scale: controller.animation.value,
              duration: const Duration(seconds: 2),
              curve: Curves.easeOutExpo,
              child: Image.asset(
                'assets/logo/splash_screen.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
