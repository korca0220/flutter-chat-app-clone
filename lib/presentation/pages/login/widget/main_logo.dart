// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 140.w,
          height: 140.h,
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        Text(
          '당신 근처의 당근마켓',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          '내 동네를 설정하고\n당근마켓을 시작해보세요.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
