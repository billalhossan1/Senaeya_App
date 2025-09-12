import 'package:Senaeya/Core/AppRoute/app_route.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OtpVerificationController extends GetxController {
  final otpController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;

  void verifyOtp() async {
    final otp = otpController.text.trim();
    errorMessage.value = '';
    successMessage.value = '';
    if (!_validateOtp(otp)) {
      errorMessage.value = 'Please enter a valid 4-digit code.';
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate network call
    isLoading.value = false;
    if (otp == '1234') { // Example correct OTP
      successMessage.value = 'OTP verified successfully!';
      Get.offNamed(AppRoute.loginScreen);

    } else {
      errorMessage.value = 'Invalid OTP. Please try again.';
    }
  }

  bool _validateOtp(String otp) {
    return otp.length == 4 && int.tryParse(otp) != null;
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
