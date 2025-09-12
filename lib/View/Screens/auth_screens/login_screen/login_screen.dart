import 'package:Senaeya/View/Screens/auth_screens/login_screen/widgets/custom_button.dart';
import 'package:Senaeya/View/Widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/login_screen_controller.dart';
import 'widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Sign In',
            titleColor: Colors.black,
            icon: Icons.cloud_outlined,
          ),
          backgroundColor: const Color(0xFF1766A0),

          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Text('Welcome back', style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4.h),
                  Text('Log in', style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: controller.phoneController,
                            hintText: '+966 5xxxxxxxxx',
                            icon: Icons.phone_android,
                            keyboardType: TextInputType.phone,
                          ),
                          CustomTextFormField(
                            controller: controller.passwordController,
                            hintText: '********************',
                            icon: Icons.lock_outline,
                            obscureText: true,
                          ),
                          SizedBox(height: 16.h),
                          Obx(() => CustomButton(
                            onPressed: controller.login,
                            text: 'Login',
                            isLoading: controller.isLoading.value,
                          )),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: controller.toggleRememberMe,
                                activeColor: const Color(0xFF1766A0),
                              )),
                              Text('Remember me', style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text('Use fingerprint login', style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                          SizedBox(height: 8.h),
                          Obx(() => controller.isLoading.value
                            ? SizedBox(
                                height: 48.w,
                                child: const Center(child: CircularProgressIndicator(color: Colors.red)),
                              )
                            : GestureDetector(
                                onTap: controller.fingerprintLogin,
                                child: Icon(Icons.fingerprint, color: Colors.red, size: 48.w),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.forgotPassword();
                          },
                          child: Text('Forgot password?', style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Create a new account', style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
