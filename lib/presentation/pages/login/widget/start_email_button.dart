// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// global widget
import 'package:flutter_chat_app_clone/global/widget/widget.dart'
    show CommonButton;

// widget
import 'package:flutter_chat_app_clone/presentation/pages/login/widget/email_auth_dialog.dart';

class StartEmailButton extends StatelessWidget {
  const StartEmailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          pageBuilder: (context, animation, secondaryAnimation) {
            return const EmailAuthDialog();
          },
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: FaIcon(
              FontAwesomeIcons.user,
              color: Colors.white,
            ),
          ),
          Text(
            '이메일로 시작하기',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
