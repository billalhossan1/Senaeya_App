
import 'package:Senaeya/View/Screens/nav_screen/controller/navigation_controller.dart';
import 'package:get/get.dart';
import '../../View/Screens/home_screen/Controller/home_controller.dart';
import '../../View/Screens/splash_screen/controller/splash_screen_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {

    ///================ Auth controller =================

    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => NavigationController(), fenix: true);

  }
}
