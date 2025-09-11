
import 'package:get/get.dart';
import 'package:FoodCrew/View/Screens/HomeScreen/Controller/home_controller.dart';

import '../../Global/controller/food_review_controller.dart';
import '../../View/Screens/splash_screen/controller/splash_screen_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {

    ///================ Auth Controller =================

    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => FoodReviewController(), fenix: true);

  }
}
