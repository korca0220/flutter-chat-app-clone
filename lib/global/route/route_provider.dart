// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// route group
import 'package:flutter_chat_app_clone/global/route/groups/groups.dart'
    show CommonRouteGroup;

// provider
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart'
    show authProvider, firebaseAuthProvider;

final routerProvider = Provider<GoRouter>((ref) {
  final router = ref.read(routeProvider);
  return GoRouter(
    routes: router.routes,
    refreshListenable: router,
    debugLogDiagnostics: false,
    initialLocation: '/login',
    redirect: router.redirectLogic,
  );
});

final routeProvider =
    ChangeNotifierProvider<RouteNotifier>((ref) => RouteNotifier(ref));

class RouteNotifier extends ChangeNotifier {
  final Ref ref;
  RouteNotifier(this.ref) {
    ref.listen(authProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final User? user = ref.read(authProvider);

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
