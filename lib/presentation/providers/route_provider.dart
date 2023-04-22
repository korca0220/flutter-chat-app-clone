import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_clone/global/route/groups/groups.dart';
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RouteNotifier extends ChangeNotifier {
  String? redirectLogic(BuildContext context, GoRouterState state) {
    final User? user = context.watch<AuthNotifier>().user;

    final loginIn = state.location == '/login';

    if (user == null) {
      return loginIn ? null : '/login';
    }

    if (loginIn) {
      return '/';
    } else {
      return null;
    }
  }

  List<GoRoute> get routes => [
        ...CommonRouteGroup().getRoutes(),
      ];
}
