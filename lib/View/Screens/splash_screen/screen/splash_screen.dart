import 'package:FoodCrew/View/Widgegts/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_screen_controller.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController controller = Get.find<SplashScreenController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
            () => Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: controller.animation2.value,
              child: AnimatedScale(
                scale: controller.animation.value,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOutExpo,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo/app_logo.png',
                      width: 180,
                      height: 180,
                    ),
                    const SizedBox(height: 20),
                    const Text('FoodCrew', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                          TextSpan(text: 'Crafted by Rajkumar, Billal, Rifat, Sufian, Mim & '),
                          TextSpan(
                            text: 'Tanjim (Teacher)',
                            style: TextStyle(color: Colors.orange, decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


