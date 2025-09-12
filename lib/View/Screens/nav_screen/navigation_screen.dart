import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_screen/home.dart';
import 'controller/navigation_controller.dart';
import '../Settings/settings.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find<NavigationController>();
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: navController.selectedIndex.value,
          children: const [
            HomeScreen(),
            SettingsScreen(),
            HomeScreen(),
            SettingsScreen(),
            HomeScreen(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: navController.selectedIndex.value,
            onTap: navController.changeScreen,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF1766A0),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.language), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mail_outline), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: ''),
            ],
          )),
    );
  }
}
