// flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OverlayDialog {
  static final OverlayDialog _instance = OverlayDialog._internal();
  factory OverlayDialog() => _instance;

  late final Future<LottieComposition> _composition;
  OverlayDialog._internal() {
    _composition = _loadBundle();
  }

  Future<LottieComposition> _loadBundle() async {
    var assetData = await rootBundle.load('assets/lottie/loading.json');
    return await LottieComposition.fromByteData(assetData);
  }

  void showLoading(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return FutureBuilder<LottieComposition>(
          future: _composition,
          builder: (context, snapshot) {
            return Center(
              child: (snapshot.hasError || snapshot.data == null)
                  ? CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )
                  : Lottie(
                      composition: snapshot.data!,
                      width: 150.w,
                      height: 100.h,
                    ),
            );
          },
        );
      },
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.4),
    );
  }
}
