// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// layout
import 'package:flutter_chat_app_clone/global/layout/default_layout.dart';

// utils
import 'package:flutter_chat_app_clone/global/utils/utils.dart'
    show OverlayDialog, ToastManager;

// view model
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_view_model.dart';

// widget
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/main_logo.dart';
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/start_email_button.dart';
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/start_google_button.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginScreenViewModel>();
    final pageController = usePageController(initialPage: 0);
    useEffect(() {
      final listener = viewModel.eventStream.listen((event) {
        event.when(
          routePage: (routeName) {
            context.goNamed(routeName);
          },
          popPage: () {
            context.pop();
          },
          showToast: (message) {
            ToastManager().showToast(message, context);
          },
          animationToPage: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          },
          onLoading: (isLoading) {
            if (isLoading) {
              OverlayDialog().showLoading(context);
            } else {
              context.pop();
            }
          },
        );
      });
      return listener.cancel;
    }, []);

    return DefaultLayout(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: SizedBox.shrink()),
          const MainLogo(),
          const Expanded(child: SizedBox.shrink()),
          StartEmailButton(pageController: pageController),
          SizedBox(height: 10.h),
          const StartGoogleButton(),
        ],
      ),
    );
  }
}
