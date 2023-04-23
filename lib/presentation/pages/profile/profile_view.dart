// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// layout
import 'package:flutter_chat_app_clone/global/layout/default_layout.dart';

// provider
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart'
    show AuthNotifier;

// view model
import 'package:flutter_chat_app_clone/presentation/pages/profile/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthNotifier>().user;
    final viewModel = context.watch<ProfileViewModel>();

    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.h),
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  viewModel
                      .profileImageUpload('${user.email}_profileImage.jpg');
                },
                child: Container(
                  height: 100.w,
                  width: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: user!.photoURL != null
                        ? DecorationImage(
                            image: NetworkImage(user.photoURL!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 130.w,
                child: ClipOval(
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 50.h),
          InkWell(
            onTap: () {
              viewModel.signOut();
            },
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
