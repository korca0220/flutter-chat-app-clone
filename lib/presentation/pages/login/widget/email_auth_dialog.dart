// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAuthDialog extends HookWidget {
  const EmailAuthDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: 0);
    return AlertDialog(
      content: SizedBox(
        height: 300.h,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'SignIn Email',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'asd@example.com',
                    ),
                  ),
                  TextFormField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Center(
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).primaryColor,
                        ),
                        onTap: () {
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                          );
                        },
                      ),
                      Text(
                        'SignUp Email',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'asd@example.com',
                    ),
                  ),
                  TextFormField(
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '가입하고 시작하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
