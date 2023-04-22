// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

// widget
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/sign_in_with_email_page.dart';
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/sign_up_with_email_page.dart';

class EmailAuthDialog extends StatelessWidget {
  final PageController pageController;
  const EmailAuthDialog({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300.h,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SignInWithEmailPage(
              pageController: pageController,
            ),
            SignUpWithEmailPage(
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}
