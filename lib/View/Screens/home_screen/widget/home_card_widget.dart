import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeCard extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const HomeCard({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon, height: 48.h, width: 48.w),
              SizedBox(height: 12.h),
              Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}