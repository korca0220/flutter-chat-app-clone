// flutter
import 'package:flutter/material.dart';

// packages
import 'package:go_router/go_router.dart';

// route group
import 'package:flutter_chat_app_clone/global/route/route_group.dart';

// routes
import 'package:flutter_chat_app_clone/global/route/routes.dart'
    show CommonRouteList;

// pages
import 'package:flutter_chat_app_clone/presentation/pages/pages.dart'
    show MainScreen, LoginScreen;

class CommonRouteGroup implements RouteGroup {
  @override
  List<GoRoute> getRoutes() {
    return [
      GoRoute(
        name: CommonRouteList.login.name,
        path: CommonRouteList.login.path,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        name: CommonRouteList.home.name,
        path: CommonRouteList.home.path,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MainScreen(),
        ),
      ),
    ];
  }
}
