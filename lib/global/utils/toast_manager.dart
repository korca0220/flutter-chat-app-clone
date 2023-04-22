// packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart' as toast;

class ToastManager {
  static final ToastManager _instance = ToastManager._internal();
  factory ToastManager() => _instance;

  ToastManager._internal();

  void showToast(String message, BuildContext context) {
    toast.showToast(
      message,
      context: context,
      position: toast.StyledToastPosition.top,
      animation: toast.StyledToastAnimation.fade,
      reverseAnimation: toast.StyledToastAnimation.fade,
      duration: const Duration(seconds: 3),
      alignment: Alignment.center,
      backgroundColor: Colors.grey.shade500,
      borderRadius: BorderRadius.all(Radius.circular(3.r)),
      fullWidth: true,
      toastHorizontalMargin: 20.r,
    );
  }
}
