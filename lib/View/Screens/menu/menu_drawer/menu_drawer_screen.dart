import 'package:Senaeya/Utils/AppIcons/app_icons.dart';
import 'package:Senaeya/Utils/AppImg/app_img.dart';
import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widget/menu_item_widget.dart';
import 'controller/menu_controller.dart';

class MenuDrawerScreen extends StatelessWidget {
  const MenuDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(
      init: MenuController(),
      builder: (controller) {
        return Drawer(
          child: SizedBox(
            width: 200.w,
            child: Container(
              color: const Color(0xFF1766A0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    // Logo
                   Padding(
                     padding: const EdgeInsets.only(left: 30.0),
                     child: Container(
                          width: 90.w,
                          height: 90.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4.w),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: SvgPicture.asset(
                              AppLogo.logo, // Use your logo asset
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                   ),
                    // Exit icon
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.exit_to_app, color: Colors.white, size: 28),
                        onPressed: controller.exitApp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Menu items
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.r),
                            topRight: Radius.circular(32.r),
                          ),
                        ),
                        child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                          children: [
                            MenuItem(icon: Icons.home, label: 'Home', onTap: controller.goToHome),
                            MenuItem(icon: Icons.list_alt, label: 'add works items', onTap: controller.goToAddWorks),
                            MenuItem(icon: Icons.info_outline, label: 'App explain', onTap: controller.goToAppExplain),
                            MenuItem(icon: Icons.description, label: 'Terms & Conditions', onTap: controller.goToTerms),
                            MenuItem(icon: Icons.people_outline, label: 'About us', onTap: controller.goToAboutUs),
                            Divider(height: 32.h),
                            MenuItem(icon: Icons.star,iconColor: Colors.yellow, label: 'App Rating', onTap: controller.goToAppRating),
                            MenuItem(icon: Icons.share_outlined, label: 'App Sharing', onTap: controller.goToAppSharing),
                            Divider(height: 32.h),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Text('Contact us',textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Image.asset(AppImages.internet),
                                  onPressed: () => controller.openContact('web'),
                                ),
                                IconButton(
                                  icon: Image.asset(AppImages.youtube),
                                  onPressed: () => controller.openContact('youtube'),
                                ),
                                IconButton(
                                  icon: Image.asset(AppImages.tiktok),
                                  onPressed: () => controller.openContact('tiktok'),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'App version\n',
                                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: '1.0.1',
                                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
