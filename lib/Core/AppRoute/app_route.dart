import 'package:get/get.dart';
import '../../View/Screens/splash_screen/screen/splash_screen.dart';
<<<<<<< HEAD
=======
import '../../View/Screens/nav_screen/navigation_screen.dart';
import '../../View/Screens/auth_screens/login_screen/login_screen.dart';
>>>>>>> 0dbfa484c4e729b32b3d5c680eb974f1bc3423a1

class AppRoute {
  ///==================== Initial Routes ====================
  static const String splashScreen = "/splash_screen";
  static const String navScreen = "/navScreen";
  static const String homeScreen = "/homeScreen";
  static const String loginScreen = "/loginScreen";

  static List<GetPage> routes = [
    ///==================== Initial Routes ====================
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: navScreen, page: () => const NavigationScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
  ];
}
