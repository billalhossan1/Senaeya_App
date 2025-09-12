import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final IconData? icon;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.titleColor,
    this.icon,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: SafeArea(
        child: Row(
          children: [
            if (onBack != null)
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: onBack,
              ),
            if (onBack != null)
               SizedBox(width: 8.w),
            if (onBack == null)
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.transparent),
                onPressed: (){},
              ),
            if (onBack == null)
               SizedBox(width: 8.w),

            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
            ),
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: Colors.blue,
                      size: 30.w,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
