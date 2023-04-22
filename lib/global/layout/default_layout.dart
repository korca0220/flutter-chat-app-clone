// flutter
import 'package:flutter/material.dart';

class DefaultLayout extends Scaffold {
  DefaultLayout({
    required Widget body,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 20),
    PreferredSizeWidget? appBar,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    List<Widget>? persistentFooterButtons,
    Widget? drawer,
    Widget? bottomSheet,
    Color? backgroundColor,
    bool resizeToAvoidBottomInset = true,
    bool primary = true,
    bool top = true,
    bool bottom = true,
    double bottomMinimum = 10,
    Key? key,
  }) : super(
          key: key,
          appBar: appBar,
          body: _buildBody(body, padding, top, bottom, bottomMinimum),
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          endDrawerEnableOpenDragGesture: false,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
        );

  static Widget _buildBody(Widget body, EdgeInsetsGeometry padding, bool top,
      bool bottom, double bottomMinimum) {
    return SafeArea(
      top: top,
      bottom: bottom,
      minimum: EdgeInsets.only(bottom: bottomMinimum),
      child: Padding(
        padding: padding,
        child: body,
      ),
    );
  }
}
