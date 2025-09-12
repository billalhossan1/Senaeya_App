import 'package:Senaeya/Core/AppRoute/app_route.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ForgotScreenController extends GetxController {
  final phoneController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;

  void sendResetLink() async {
    final email = phoneController.text.trim();
    errorMessage.value = '';
    successMessage.value = '';
    if (!_validateEmail(email)) {
      errorMessage.value = 'Please enter a valid email address.';
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate network call
    isLoading.value = false;
    successMessage.value = 'Password reset link sent to $email.';
  }

  bool _validateEmail(String email) {
    return email.isNotEmpty && email.contains('@');
  }

  void onTapForgotPassword() {
    Get.toNamed(AppRoute.otpVerificationScreen);
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}

