// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// event
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_event.dart';

// global widget
import 'package:flutter_chat_app_clone/global/widget/widget.dart'
    show CommonButton;

// view model
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_view_model.dart';

class StartGoogleButton extends StatelessWidget {
  const StartGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginScreenViewModel>();
    return CommonButton(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: FaIcon(
              FontAwesomeIcons.google,
            ),
          ),
          Text(
            'Google로 시작하기',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
      onTap: () {
        viewModel.onEvent(const LoginScreenEvent.signInWithGoogle());
      },
    );
  }
}
