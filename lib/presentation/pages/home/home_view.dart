// Flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

// default layout
import 'package:flutter_chat_app_clone/global/layout/default_layout.dart';

// widget
import 'package:flutter_chat_app_clone/presentation/pages/home/widget/home_app_bar.dart';
import 'package:flutter_chat_app_clone/presentation/pages/home/widget/sell_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: const HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 34.r,
        ),
      ),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.h);
        },
        itemBuilder: (context, index) {
          return const SellItem();
        },
      ),
    );
  }
}
