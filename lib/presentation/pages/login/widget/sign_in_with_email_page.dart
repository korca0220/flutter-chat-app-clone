// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// event
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_event.dart';

// view model
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_view_model.dart';

class SignInWithEmailPage extends HookWidget {
  const SignInWithEmailPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginScreenViewModel>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return SizedBox(
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
            controller: emailController,
            maxLines: 1,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'asd@example.com',
            ),
          ),
          TextFormField(
            controller: passwordController,
            maxLines: 1,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 30.h),
          InkWell(
            onTap: () {
              viewModel.onEvent(LoginScreenEvent.signInWithEmail(
                emailController.text,
                passwordController.text,
              ));
            },
            child: Container(
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
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              viewModel.onEvent(const LoginScreenEvent.onTapJump(1));
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
    );
  }
}
