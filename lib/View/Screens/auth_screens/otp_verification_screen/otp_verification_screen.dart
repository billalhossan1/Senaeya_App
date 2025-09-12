import 'package:Senaeya/View/Screens/auth_screens/login_screen/widgets/custom_button.dart';
import 'package:Senaeya/View/Widgegts/custom_text/custom_text.dart';
import 'package:Senaeya/View/Widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'controller/otp_verification_controller.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpVerificationController>(
      init: OtpVerificationController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            title: "OTP Verification",
            titleColor: Colors.black,
            icon: Icons.cloud_outlined,
            onBack: () => Get.back(),
          ),
          backgroundColor: const Color(0xFF1766A0),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "OTP Code",
                            fontWeight: FontWeight.w600,
                            fontSize: 24.w,
                          ),
                          SizedBox(height: 10.w,),
                          CustomText(
                            text: "Enter the activation code sent to",
                            fontSize: 18.w,
                          ),
                          SizedBox(height: 6.h),
                          CustomText(
                            text: "your mobile phone via WhatsApp",
                            fontSize: 18.w,
                          ),
                          SizedBox(height: 24.h),
                          PinCodeTextField(
                            appContext: context,
                            length: 4,
                            controller: controller.otpController,
                            autoFocus: true,
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(8.r),
                              fieldHeight: 60.w,
                              fieldWidth: 60.w,
                              activeFillColor: Colors.white,
                              selectedFillColor: Colors.white,
                              inactiveFillColor: const Color(0xffF4F5F7),
                              activeColor: Colors.blue,
                              selectedColor: Colors.blue,
                              inactiveColor: Colors.grey,
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 16.h),
                          Obx(() => controller.errorMessage.value.isNotEmpty
                              ? Text(
                                  controller.errorMessage.value,
                                  style: TextStyle(color: Colors.red),
                                )
                              : SizedBox()),
                          Obx(() => controller.successMessage.value.isNotEmpty
                              ? Text(
                                  controller.successMessage.value,
                                  style: TextStyle(color: Colors.green),
                                )
                              : SizedBox()),
                          SizedBox(height: 16.h),
                          Obx(() => CustomButton(
                                onPressed: controller.verifyOtp,
                                text: 'Verify OTP',
                                isLoading: controller.isLoading.value,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
