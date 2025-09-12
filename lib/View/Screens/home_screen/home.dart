import 'package:Senaeya/Utils/AppImg/app_img.dart';
import 'package:Senaeya/View/Screens/home_screen/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Senaeya/View/Screens/Menu/menu_drawer/menu_drawer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const MenuDrawerScreen(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: Container(
          color: const Color(0xFF1766A0),
          child: SafeArea(
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: SvgPicture.asset(AppIcon.menu, height: 28.w, width: 28.w),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.notifications_none, color: Colors.white, size: 28),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Blue header section with welcome text
          Container(
            width: double.infinity,
            color: const Color(0xFF1766A0),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                const Text('Welcome', style: TextStyle(color: Colors.white, fontSize: 20)),
                Obx(() => Text(controller.businessName.value, style: const TextStyle(color: Colors.white, fontSize: 16))),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          // Curved design implementation
          Stack(
            children: [
              // Blue container with bottom curved corners
              Container(
                width: double.infinity,
                height: 32.h,
                color: const Color(0xFF1766A0),


              ),
              // Red container with top curved corners positioned over blue
              Positioned(
                top: 8.h,
                left: 0,
                right: 0,
                child: Container(
                  height: 24.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE94F4F),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Main content area
          Expanded(
            child: Container(
              color: const Color(0xFFE94F4F),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: GridView.count(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  crossAxisCount: 2,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 0.95,
                  children: [
                    HomeCard(
                      icon: AppImages.person,
                      label: 'Add Customer',
                      onTap: controller.onAddCustomer,
                    ),
                    HomeCard(
                      icon: AppImages.invoice,
                      label: 'New invoice',
                      onTap: controller.onNewInvoice,
                    ),
                    HomeCard(
                      icon: AppImages.persons,
                      label: 'Customers',
                      onTap: controller.onCustomers,
                    ),
                    HomeCard(
                      icon: AppImages.previousInvoice,
                      label: 'Previous invoices',
                      onTap: controller.onPreviousInvoices,
                    ),
                    HomeCard(
                      icon: AppImages.report,
                      label: 'Reports',
                      onTap: controller.onReports,
                    ),
                    HomeCard(
                      icon: AppImages.expense,
                      label: 'Expenses',
                      onTap: controller.onExpenses,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

