import 'package:get/get.dart';

class FoodReviewController extends GetxController {
  var highBloodPressure = ''.obs;
  var looseWeight = ''.obs;
  var pregnantOrNursing = ''.obs;
  var childUnder12 = ''.obs;
  var diet = ''.obs;
  var mainGoal = ''.obs;

  bool validate() {
    return diet.isNotEmpty;
  }

  void submit() {
    // Add your submit logic here
    // For example, send data to backend or save locally
  }
}

