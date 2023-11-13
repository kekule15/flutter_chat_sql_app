import 'package:chat/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavCardWidget extends ConsumerWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  const NavCardWidget(
      {required this.title,
      required this.icon,
      required this.isActive,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: isActive ? AppColors.secondary : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            // ignore: deprecated_member_use
            color: isActive ? AppColors.black : AppColors.gray,
            size: 20.w,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                fontSize: 10.sp,
                color: isActive
                    ? AppColors.black
                    : Theme.of(context).primaryTextTheme.headlineMedium!.color),
          ),
        ],
      ),
    );
  }
}
