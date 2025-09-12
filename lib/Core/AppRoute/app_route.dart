import 'package:Senaeya/View/Screens/auth_screens/forgot_screen/forgot_screen.dart';
import 'package:Senaeya/View/Screens/auth_screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:get/get.dart';
import '../../View/Screens/auth_screens/login_screen/login_screen.dart';
import '../../View/Screens/nav_screen/navigation_screen.dart';
import '../../View/Screens/splash_screen/screen/splash_screen.dart';

class AppRoute {
  ///==================== Initial Routes ====================
  static const String splashScreen = "/splash_screen";
  static const String navScreen = "/navScreen";
  static const String homeScreen = "/homeScreen";
  static const String loginScreen = "/loginScreen";
  static const String forgetScreen = "/forgetScreen";
  static const String otpVerificationScreen = "/otpVerificationScreen";

  static List<GetPage> routes = [
    ///==================== Initial Routes ====================
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: navScreen, page: () => const NavigationScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: forgetScreen, page: () => const ForgotScreen()),
    GetPage(name: otpVerificationScreen, page: () => const OtpVerificationScreen()),
  ];
}
