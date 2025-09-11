import 'package:get/get.dart';
import 'package:FoodCrew/View/Screens/HomeScreen/home.dart';
import '../../View/Screens/splash_screen/screen/splash_screen.dart';
import '../../View/splash_screen/screen/splash_screen.dart';

class AppRoute {
  ///==================== Initial Routes ====================
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/homeScreen";


  static List<GetPage> routes = [
    ///==================== Initial Routes ====================

    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: homeScreen, page: () =>  HomeScreen()),



  ];
}
