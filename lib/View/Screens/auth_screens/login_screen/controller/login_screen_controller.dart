import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreenController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;
  final LocalAuthentication auth = LocalAuthentication();

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void login() {
    // TODO: Implement login logic
    // Example: print(phoneController.text);
  }

  Future<void> fingerprintLogin() async {
    isLoading.value = true;
    print('Fingerprint login started');
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      print('Can check biometrics: '
          '$canCheckBiometrics');
      bool isDeviceSupported = await auth.isDeviceSupported();
      print('Is device supported: $isDeviceSupported');
      if (!canCheckBiometrics || !isDeviceSupported) {
        print('Biometric authentication not available on this device');
        Get.snackbar('Error', 'Biometric authentication not available on this device', backgroundColor: Colors.red, colorText: Colors.white);
        isLoading.value = false;
        return;
      }
      List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
      print('Available biometrics: $availableBiometrics');
      if (!availableBiometrics.contains(BiometricType.fingerprint)) {
        print('Fingerprint not enrolled');
        Get.snackbar('Error', 'Fingerprint not enrolled', backgroundColor: Colors.red, colorText: Colors.white);
        isLoading.value = false;
        return;
      }
      bool authenticated = await auth.authenticate(
        localizedReason: 'Authenticate with fingerprint',
        options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true),
      );
      print('Authenticated: $authenticated');
      isLoading.value = false;
      if (authenticated) {
        print('Fingerprint authentication successful');
        Get.snackbar('Success', 'Fingerprint authentication successful', backgroundColor: Colors.green, colorText: Colors.white);
        // TODO: Proceed with login or navigation
      } else {
        print('Fingerprint authentication failed');
        Get.snackbar('Failed', 'Fingerprint authentication failed', backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print('Authentication error: $e');
      isLoading.value = false;
      Get.snackbar('Error', 'Authentication error: \n$e', backgroundColor: Colors.red, colorText: Colors.white);
    }
    print('Fingerprint login finished');
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
