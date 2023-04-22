// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// firebase option
import 'package:flutter_chat_app_clone/firebase_options.dart';

// providers
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart'
    show RouteNotifier, getProviders;

// route groups
import 'package:flutter_chat_app_clone/global/route/groups/groups.dart'
    show CommonRouteGroup;

// widget
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final providers = await getProviders();
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

List<GoRoute> get routes => [
      ...CommonRouteGroup().getRoutes(),
    ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final route = context.watch<RouteNotifier>();
    final router = GoRouter(
      routes: route.routes,
      initialLocation: '/login',
      redirect: route.redirectLogic,
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, snapshot) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: const Color(0xffe78111),
            scaffoldBackgroundColor: Colors.grey.shade900,
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade900,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          routerConfig: router,
        );
      },
    );
  }
}
