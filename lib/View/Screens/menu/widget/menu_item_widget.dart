import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;
  const MenuItem({super.key, required this.icon, required this.label, required this.onTap,  this.iconColor=Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 28.w),
      title: Text(label, style: TextStyle(fontSize: 16.sp)),
      onTap: onTap,
    );
  }
}