// flutter
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_clone/global/layout/default_layout.dart';

// packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

// widget
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/main_logo.dart';
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/start_email_button.dart';
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/start_google_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: SizedBox.shrink()),
          const MainLogo(),
          const Expanded(child: SizedBox.shrink()),
          const StartEmailButton(),
          SizedBox(height: 10.h),
          const StartGoogleButton(),
        ],
      ),
    );
  }
}
